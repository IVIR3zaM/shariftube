<div class="navbar navbar-top row">
    <div class="col-sm-3 col-xs-12 clearfix logo">
        <a href="/">
            <img class="logo-top-navbar" src="{{ url.getBaseUri() }}images/logo.png" alt="Sharif Tube">
        </a>
    </div>
    <div class="col-sm-9 col-xs-12 user-area">
        <div class="user-quota clearfix">
            <div class="user-area-inner clearfix">
                <!-- Avatar -->
                <div class="user-area-avatar">
                    <a class="badge badge-red badge-rounded user-area-logout" href="{{ url.get(['for':'logout']) }}"><i class="fa fa-power-off"></i></a>
                    <img class="img-rounded" src="https://www.gravatar.com/avatar/{{ auth.getIdentity().email|md5 }}.jpg?s=60" alt="{{ auth.getIdentity().email|e }}">
                </div>
                <!-- Name -->
                <div class="user-area-name">
                    {{ auth.getIdentity().name|e }}
                </div>
            </div>
            <div class="user-quota-inner clearfix">
                <!-- Progress -->
                <div class="user-quota-progress">
                    {% if auth.getIdentity().quota > 0 %}
                    <div class="quota-progress-bar">
                        <div class="bar" data-quota-used="{{ ((auth.getIdentity().used*100)/auth.getIdentity().quota)|intval }}"></div>
                        <!-- More than 70% remaining -->
                        {% if (((auth.getIdentity().used*100)/auth.getIdentity().quota))|intval < 30 %}
                        <div class="info text-en btn-success"></div>
                        <!-- less than 70% and more than 30% remainig -->
                        {% elseif (  (  (  (auth.getIdentity().used*100)/auth.getIdentity().quota  )  )|intval > 30 and (  (  (auth.getIdentity().used*100)/auth.getIdentity().quota  )  )|intval < 70  ) %}
                        <div class="info text-en btn-warning"></div>
                        <!-- Less than 30% remaining -->
                        {% else %}
                        <div class="info text-en btn-danger"></div>
                        {% endif %}
                        <div id="info" class="text-en text-ltr">
                            {% if auth.getIdentity().quota >= 1073741824 %}
                            {{ number_format(auth.getIdentity().used/1024/1024/1024, 2) }} GB / {{ number_format(auth.getIdentity().quota/1024/1024/1024, 2) }} GB
                            {% else %}
                            {{ number_format(auth.getIdentity().used/1024/1024, 2) }} MB / {{ number_format(auth.getIdentity().quota/1024/1024, 2) }} MB
                            {% endif %}
                        </div>
                    </div>
                    {% else %}
                    <div class="quota-progress-bar">
                        <div class="bar" style="width:98%;"></div>
                        <div class="info text-en btn-danger"></div>
                        <div id="info" class="text-en text-ltr">
                            {{ number_format(auth.getIdentity().used/1024/1024/1024, 2) }} GB / {{ number_format(1/1024/1024/1024, 2) }} GB
                        </div>
                    </div>
                    {% endif %}
                </div>
                <!-- Buy -->
                <div class="user-quota-buy">
                    <a class="btn btn-primary" href="{{ url.get(['for':'shop']) }}"><i class="fa fa-dollar"></i> خرید حجم</a>
                    <a class="btn btn-danger" href="{{ url.get(['for':'logout']) }}"><i class="fa"></i>خروج</a>&nbsp;&nbsp;&nbsp;
                    {% if admin %}
                        <span>مجموع خرید: {{ number_format(purchases_amount, 0) }} ریال</span>&nbsp;&nbsp;&nbsp;
                        <span>کل کاربران: {{ number_format(users_count, 0) }}</span>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row top-links">
    <div class="col-xs-12">
        <ul class="list-unstyled list-top-links clearfix {% if auth.getIdentity().referral_code %} is-referral {% endif %}">
            {% if auth.getIdentity().referral_code %}
            <li class="dropdown">
                <span class="fake-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">اطلاعات درآمد شما <span class="caret"></span></span>
                <ul class="dropdown-menu">
                     <li>
                          تعداد افراد معرفی شده: {{ number_format(referral_count, 0) }}
                    </li>
                     <li>
                        درآمد این ماه: {{ number_format(month_incomes, 0) }} ریال
                     </li>
                    <li>
                      درآمد کل: {{ number_format(total_incomes, 0) }} ریال
                    </li>
                </ul>
            </li>
            {% endif %}
            {% if auth.getIdentity().status != 'Suspended' %}
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
            {% endif %}
            <li>
                <a{% if dispatcher.getActionName() == 'support' %} class="active"{% endif %} href="{{ url.get(['for':'support']) }}">پشتیبانی {% if open_tickets > 0 %}<span class="badge badge-red badge-rounded badge-support">{{ open_tickets|e }}</span>{% endif %}</a>
            </li>
            {% if auth.getIdentity().status != 'Suspended' %}
            <li>
                <a{% if dispatcher.getActionName() == 'settings' %} class="active"{% endif %} href="{{ url.get(['for':'settings']) }}">تنظیمات</a>
            </li>
            {% endif %}
        </ul>
    </div>
</div>