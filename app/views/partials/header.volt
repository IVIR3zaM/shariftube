<div class="panel-right">
    <img src="http://www.gravatar.com/avatar/{{ auth.getIdentity().email|md5 }}.jpg?s=50" alt="{{ auth.getIdentity().email|e }}"/>
    {{ auth.getIdentity().name|e }}
    <div class="progress-bar">
        <div class="bar" style="width: {{ ((auth.getIdentity().used*100)/auth.getIdentity().quota)|intval }}%;"></div>
        <div class="info">
            {{ number_format(auth.getIdentity().used/1024/1024/1024, 2) }}GB/{{ number_format(auth.getIdentity().quota/1024/1024/1024, 2) }}GB
        </div>
    </div>
    <a href="{{ url.get(['for':'shop']) }}">خرید حجم</a>
    <a href="{{ url.get(['for':'logout']) }}">خروج</a>
</div>
<div class="panel-left">
    {% if auth.getIdentity().referral_code %}
        تعداد افراد معرفی شده: {{ number_format(referral_count, 0) }}<br />
        درآمد این ماه: {{ number_format(month_incomes, 0) }} ریال<br />
        درآمد کل: {{ number_format(total_incomes, 0) }} ریال
    {% endif %}
</div>
<div class="clear"></div>
<ul class="links">
    <li>
        <a{% if dispatcher.getActionName() == 'search' %} class="active"{% endif %} href="{{ url.get(['for':'search']) }}">جست و جوی ویدئو</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'index' %} class="active"{% endif %} href="{{ url.get(['for':'home']) }}">درخواست ویدئو</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'files' %} class="active"{% endif %} href="{{ url.get(['for':'files']) }}">لیست ویدئوها</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'shop' %} class="active"{% endif %} href="{{ url.get(['for':'shop']) }}">خرید</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'purchases' %} class="active"{% endif %} href="{{ url.get(['for':'purchases']) }}">لیست خریدهای گذشته</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'support' %} class="active"{% endif %} href="{{ url.get(['for':'support']) }}">پشتیبانی</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'settings' %} class="active"{% endif %} href="{{ url.get(['for':'settings']) }}">تنظیمات</a>
    </li>
</ul>