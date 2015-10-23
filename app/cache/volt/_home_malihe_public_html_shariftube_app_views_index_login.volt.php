<?php echo $this->flash->output(); ?>

<form action="<?php echo $this->url->get(array('for' => 'login')); ?>" method="post">
    <fieldset>
        <legend>ورود به سایت:</legend>
        <input type="text" name="email" placeholder="ایمیل"><br>
        <input type="password" name="password" placeholder="رمز عبور"><br>
        <input type="submit" name="login" value="ورود">
    </fieldset>
</form>

<form action="<?php echo $this->url->get(array('for' => 'login')); ?>" method="post">
    <fieldset>
        <legend>ثبت نام در سایت:</legend>
        <input type="text" name="email" placeholder="ایمیل" value="<?php echo $this->escaper->escapeHtml($this->request->getPost('email')); ?>"><br>
        <input type="text" name="email_confirm" placeholder="تکرار ایمیل" value="<?php echo $this->escaper->escapeHtml($this->request->getPost('email_confirm')); ?>"><br>
        <input type="text" name="name" placeholder="نام شما" value="<?php echo $this->escaper->escapeHtml($this->request->getPost('name')); ?>"><br>
        <input type="text" name="code" placeholder="کد معرف شما" value="<?php echo $this->escaper->escapeHtml($this->request->getPost('code')); ?>"><br>
        <input type="password" name="password" placeholder="رمز عبور"><br>
        <input type="submit" name="signup" value="ثبت نام">
    </fieldset>
</form>

<form action="<?php echo $this->url->get(array('for' => 'login')); ?>" method="post">
    <fieldset>
        <legend>فراموشی رمز عبور:</legend>
        <input type="text" name="email" placeholder="ایمیل"><br>
        <input type="submit" name="forgot" value="ارسال درخواست">
    </fieldset>
</form>