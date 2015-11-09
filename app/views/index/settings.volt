<div class="main-section">
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
</div>
<form method="post" class="form-condensed search-bar" action="{{ url.get(['for':'settings'])|e }}">
    <table class="table text-center">
        {% if user.getReferral() %}
        <tr>
            <td>معرف: </td>
            <td>{{ user.getReferral().name|e }}</td>
        </tr>
        {% endif %}
        <tr>
            <td>ایمیل: </td>
            <td>
                {{ user.email|e }}
                <div class="text-danger no-hide">
                    برای تغییر ایمیل با پشتیبانی تماس بگیرید
                </div>
            </td>
        </tr>
        <tr>
            <td>رمز عبور جدید: </td>
            <td>
                <input class="form-group" type="password" name="new_password">
                <div class="text-danger no-hide">
                    در صورتی که مایل به تغییر نیستید این گزینه را خالی رها کنید
                </div>
            </td>
        </tr>
        <tr>
            <td>تکرار رمز عبور: </td>
            <td>
                <input type="password" name="confirm_password">
            </td>
        </tr>
        <tr>
            <td>نام شما: </td>
            <td>
                <input type="text" name="name" value="{{ user.name|e }}">
            </td>
        </tr>
        <tr>
            <td>رمز عبور فعلی: </td>
            <td>
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="center">
                <input class="btn btn-success btn-sm" type="submit" name="apply" value="ذخیره">
            </td>
        </tr>
    </table>
</form>