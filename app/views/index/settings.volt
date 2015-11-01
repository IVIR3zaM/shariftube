{{ flash.output() }}
<form method="post" action="{{ url.get(['for':'settings']) }}">
    <table class="settings">
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
                <div class="alert alert-notice">
                    برای تغییر ایمیل با پشتیبانی تماس بگیرید
                </div>
            </td>
        </tr>
        <tr>
            <td>رمز عبور جدید: </td>
            <td>
                <input type="password" name="new_password">
                <div class="alert alert-notice">
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
            <td colspan="2" class="center">
                <input type="submit" name="apply" value="ذخیره">
            </td>
        </tr>
    </table>
</form>