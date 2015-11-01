{% if announcements|length %}
<ul>
    {% for record in announcements %}
    <li>
        <h3>{{ record.title|e }}</h3>
        <p>
            {{ record.content|e|nl2br }}
        </p>
    </li>
    {% endfor %}
</ul>
{% endif %}
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
        <a{% if dispatcher.getActionName() == 'support' %} class="active"{% endif %} href="{{ url.get(['for':'support']) }}">پشتیبانی{% if open_tickets > 0 %}({{ open_tickets|e }}){% endif %}</a>
    </li>
    <li>
        <a{% if dispatcher.getActionName() == 'settings' %} class="active"{% endif %} href="{{ url.get(['for':'settings']) }}">تنظیمات</a>
    </li>
</ul>
<div>
    گروه نرم افزاری وینیکس
</div>