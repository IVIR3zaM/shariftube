<!-- Top Logo -->
<div class="top-logo text-center">
    <img src="{{ url.getBaseUri() }}images/logo.png" alt="SharifTube">
</div>

<div class="bg-white" data-tab-holder="login-tab">

    <!-- Login -->
    <form data-tab-role="#login" class="form-condensed clearfix active" action="{{ url.get(['for' : 'login']) }}" method="post">
        <h2 class="form-head text-center">ورود</h2>
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
        <h2 class="form-head text-center">ثبت نام</h2>
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
        <div class="form-group clearfix checkbox-control">
            <div id="policy-content">
                <p><span class="close"><i class="fa fa-times"></i></span>
                    اینجانب، با استفاده از سرویس اختصاصی شریف تیوب، متعهد می شوم که تمامی ویدیو های دانلود شده توسط بنده در جهت اهداف آکادمیک، تحقیقات علمی و یا سایر اهداف آموزشی است و هر گونه فعالیتی که شامل گزینه های مذکور نباشد، به شریف تیوب این اجازه را می دهد که اطلاعات بنده را در اختیار مراجع مربوط قرار دهد.<br/>
                    هم چنین پس از طی مراحل خرید بنده در این سرویس در صورتی که به هر دلیلی سرویس اختصاصی شریف تیوب قادر به ادامه ی ارایه سرویس نباشد، هیچ تعهد و مسیولیتی در قبال بازگشت وجه پرداختی از سوی سرویس شریف تیوب به کاربر مورد نظر پذیرفته نیست. در قبال موارد مذکور، سرویس شریف تیوب نیز متعهد می شود در صورت بروز هرگونه مشکلی که نهایتا منجر به عدم ادامه ی ارایه سرویس فعلی شود، در صورت امکان حداکثر یک ماه قبل از اتمام ارایه سرویس، کاربران محترم را از این رخداد باخبر نماید.<br/>
                    با سپاس از زمان با ارزش شما کار بر محترم<br/>
                    گروه نرم افزاری وینیکس
                </p>
            </div>
            <div id="policy-trigger">
                <button type="button">?</button>
            </div>
            <div class="col-xs-8">
                <label style="margin-bottom:0" for="policy">قوانین این وب سایت را می پذیرم</label>
            </div>
            <div class="col-xs-4">
                <input style="margin-top:0" type="checkbox" id="policy">
            </div>
        </div>
        <div class="form-group submit-register">
            <input disabled class="btn btn-green btn-block fa" type="submit" name="signup" value="&#xf00c">
        </div>
        {{ flash.output() }}
        <div class="form-group text-left">
            <a data-tab-trigger="#login" href="#" type="button">بازگشت</a>
        </div>
    </form>

    <!-- Forgot Password -->
    <form data-tab-role="#forgot_password" class="form-condensed clearfix" action="{{ url.get(['for' : 'login']) }}" method="post">
        <h3 class="form-head text-center"><small>فراموشی رمز عبور</small></h3>
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
