<!-- Top Logo -->
<div class="top-logo text-center">
    <img src="{{ url.getBaseUri() }}images/logo.png" alt="SharifTube">
</div>

<div class="bg-white" data-tab-holder="login-tab">

    <!-- Login -->
    <form data-tab-role="#login" class="form-condensed clearfix active" action="{{ url.get(['for' : 'login']) }}" method="post">
        <h2 class="form-head">ورود</h2>
        <div class="form-group form-group-st form-group-round">
            <label for="email">ایمیل</label>
            <input class="form-control input-ltr input-gray" type="text" name="email">
        </div>
        <div class="form-group form-group-st form-group-round">
            <label for="password">رمز عبور</label>
            <input class="form-control input-ltr input-gray" type="password" name="password">
        </div>
        {{ flash.output() }}
        <div class="form-group text-right">
            <a data-tab-trigger="#forgot_password" href="#" type="button">رمز عبور خود را فراموش کرده ام</a>
        </div>
        <div class="form-group form-group-multi">
            <input type="submit" class="btn btn-green float-right multi-larger fa" name="login" value="&#xf00c">
            <button data-tab-trigger="#register" type="button" class="btn btn-red float-left multi-smaller" href="#">عضو نیستم</button>
        </div>
    </form>

    <!-- Register -->
    <form data-tab-role="#register" class="form-condensed clearfix" action="{{ url.get(['for' : 'login']) }}" method="post">
        <h2 class="form-head">ثبت نام</h2>
        <div class="form-group form-group-st form-group-round">
            <label for="email">ایمیل</label>
            <input class="form-control input-ltr input-gray" type="text" name="email" value="{{ request.getPost('email')|e }}">
        </div>
        <div class="form-group form-group-st form-group-round">
            <label for="email_confirm">ایمیل دوباره</label>
            <input class="form-control input-ltr input-gray" type="text" name="email_confirm" value="{{ request.getPost('email_confirm')|e }}">
        </div>
        <div class="form-group form-group-st form-group-round">
            <label for="name">نام</label>
            <input class="form-control input-ltr input-gray" type="text" name="name" value="{{ request.getPost('name')|e }}">
        </div>
        <div class="form-group form-group-st form-group-round">
            <label for="code">کد معرف</label>
            <input class="form-control input-ltr input-gray" type="text" name="code" value="{{ request.getPost('code')|e }}">
        </div>
        <div class="form-group form-group-st form-group-round">
            <label for="password">رمز عبور</label>
            <input class="form-control input-ltr input-gray" type="password" name="password">
        </div>
        {{ flash.output() }}
        <div class="form-group">
            <input class="btn btn-green btn-block fa" type="submit" name="signup" value="&#xf00c">
        </div>
        <div class="form-group text-left">
            <a data-tab-trigger="#login" href="#" type="button">بازگشت</a>
        </div>
    </form>

    <!-- Forgot Password -->
    <form data-tab-role="#forgot_password" class="form-condensed clearfix" action="{{ url.get(['for' : 'login']) }}" method="post">
        <h3 class="form-head"><small>فراموشی رمز عبور:</small></h3>
        <div class="form-group form-group-st form-group-round">
            <label for="email">ایمیل</label>
            <input class="form-control input-ltr input-gray" type="text" name="email">
        </div>
        <div class="form-group">
            <input class="btn btn-green btn-block fa" type="submit" name="forgot" value="&#xf00c">
        </div>
        {{ flash.output() }}
        <div class="form-group text-left">
            <a data-tab-trigger="#login" href="#" type="button">بازگشت</a>
        </div>
    </form>
</div>
