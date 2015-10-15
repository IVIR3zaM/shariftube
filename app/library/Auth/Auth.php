<?php
namespace Shariftube\Auth;

use Phalcon\Mvc\User\Component;
use Shariftube\Models\RememberTokens;
use Shariftube\Models\Users;
use Shariftube\Models\SuccessLogins;
use Shariftube\Models\FailedLogins;

/**
 * Shariftube\Auth\Auth
 * Manages Authentication/Identity Management in Shariftube
 */
class Auth extends Component
{
    protected $user = null;

    public function __construct()
    {
        if ($this->cookies->get('SharifUser')){
            $this->user = $this->loginWithRememberMe();
        }
    }
    /**
     * Checks the user credentials
     *
     * @param array $credentials
     * @param boolean $saveSession
     * @return boolean
     */
    public function check($credentials)
    {
        // Check if the user exist
        $user = Users::findFirst([
            'email = :email: AND deleted_at = 0',
            'bind'      => [
                'email' => $credentials['email'],
            ],
        ]);
        if ($user == false) {
            $this->registerUserThrottling(null);
            return false;
        }


        // Check the password
        if (!$this->security->checkHash($credentials['password'], $user->password)) {
            $this->registerUserThrottling($user->id);
            return false;
        }

        // Check if the user was flagged
        if (!$this->checkUserFlags($user)) {
            return false;
        }

        $this->createRememberEnviroment($user);

            // Register the successful login
            $this->saveSuccessLogin($user->id);
        $this->user = $user;


        return true;
    }

    public function createRememberEnviroment(Users $user)
    {
        $user_agent = $this->request->getUserAgent();

        $remember = new RememberTokens();
        $remember->users_id = $user->getId();
        $remember->user_agent = $user_agent;

        if ($remember->save() != false) {
            $expire = time() + (86400 * 8);
            $this->cookies->set('SharifUser', $remember->token, $expire);
        }
    }
    public function loginWithRememberMe()
    {
        $cookieToken = $this->cookies->get('SharifUser')->getValue();
        $remember = RememberTokens::findFirstByToken($cookieToken);
        if ($remember){
            $user = $remember->getUser()->getFirst();
            if ($user) {


                    // Check if the cookie has not expired
                    if ((time() - (86400 * 8)) < $remember->created_at) {

                        // Check if the user was flagged
                        $this->checkUserFlags($user);

                        $this->user = $user;
                        return true;
                    }


            }
        }
        $this->cookies->get('SharifUser')->delete();

        return false;
    }

    /**
     * Creates the remember me environment settings the related cookies and generating tokens
     *
     * @param int $userId
     * @return void
     */
    public function saveSuccessLogin($userId)
    {
        $successLogin = new SuccessLogins();
        $successLogin->user_id = $userId;
        $successLogin->ip_address = $this->request->getClientAddress();
        $successLogin->user_agent = $this->request->getUserAgent();
        $successLogin->save();
    }

    /**
     * Implements login throttling
     * Reduces the effectiveness of brute force attacks
     *
     * @param int $userId
     */
    public function registerUserThrottling($userId)
    {
        $failedLogin = new FailedLogins();
        $failedLogin->user_id = $userId;
        $failedLogin->ip_address = $this->request->getClientAddress();
        $failedLogin->save();

        $attempts = FailedLogins::count(array(
            'ip_address = :ip_address: AND created_at >= :created_at:',
            'bind' => [
                'ip_address' => $this->request->getClientAddress(),
                'created_at' => date('Y-m-d H:i:s', strtotime('-1 Hours')),
            ],
        ));

        switch ($attempts) {
            case 1:
            case 2:
                // no delay
                break;
            case 3:
            case 4:
                sleep(2);
                break;
            default:
                sleep(4);
                break;
        }
    }

    /**
     * Checks if the user is banned/inactive/suspended
     *
     * @param \Shariftube\Models\Users $user
     * @return boolean
     */
    public function checkUserFlags(Users $user)
    {
//        if (@$user->status && $user->status != 'Active') {
//            return false;
//        }

        return true;
    }

    /**
     * Returns the current identity
     *
     * @return null|\Shariftube\Models\Users $user
     */
    public function getIdentity()
    {
        return $this->user;
    }

    /**
     * Returns the current identity
     *
     * @return string
     */
    public function getName()
    {
        return @$this->user->name;
    }

    /**
     * Removes the user identity information from session
     */
    public function remove()
    {
        $this->cookies->get('SharifUser')->delete();
        $this->user = null;
    }

    /**
     * Auths the user by his/her id
     *
     * @param int $id
     * @return boolean
     */
    public function authUserById($id)
    {
        $user = Users::findFirstById($id);
        if ($user == false) {
            return false;
        }


        // Check if the user was flagged
        if (!$this->checkUserFlags($user)) {
            return false;
        }

        $this->saveSuccessLogin($user->id);
        $this->user = $user;
        return true;
    }
}
