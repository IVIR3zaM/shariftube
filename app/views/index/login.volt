{{ flash.output() }}

<form action="{{ url.get(['for' : 'login']) }}" method="post">
    <fieldset>
        <legend>ورود به سایت:</legend>
        <input type="text" name="email" placeholder="ایمیل"><br>
        <input type="password" name="password" placeholder="رمز عبور"><br>
        <input type="submit" name="login" value="ورود">
    </fieldset>
</form>

<form action="{{ url.get(['for' : 'login']) }}" method="post">
    <fieldset>
        <legend>ثبت نام در سایت:</legend>
        <input type="text" name="email" placeholder="ایمیل" value="{{ request.getPost('email')|e }}"><br>
        <input type="text" name="email_confirm" placeholder="تکرار ایمیل" value="{{ request.getPost('email_confirm')|e }}"><br>
        <input type="text" name="name" placeholder="نام شما" value="{{ request.getPost('name')|e }}"><br>
        <input type="text" name="code" placeholder="کد معرف شما" value="{{ request.getPost('code')|e }}"><br>
        <input type="password" name="password" placeholder="رمز عبور"><br>
        <input type="submit" name="signup" value="ثبت نام">
    </fieldset>
</form>

<form action="{{ url.get(['for' : 'login']) }}" method="post">
    <fieldset>
        <legend>فراموشی رمز عبور:</legend>
        <input type="text" name="email" placeholder="ایمیل"><br>
        <input type="submit" name="forgot" value="ارسال درخواست">
    </fieldset>
</form>