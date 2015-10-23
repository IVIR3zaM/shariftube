<form id="search-form" action="{{ url.get(['for':'search']) }}" method="get">
    <label for="q">عبارت</label>
    <input id="q" type="text" size="50" name="q" value="{{ q|e }}">
    <input type="submit" value="جست و جو"><br>
    <select name="dur">
        <option value="All"{% if dur == 'All' or !dur %} selected="selected"{% endif %}>هر دوره زمانی</option>
        <option value="s"{% if dur == 's' %} selected="selected"{% endif %}>تا ۴ دقیقه</option>
        <option value="m"{% if dur == 'm' %} selected="selected"{% endif %}>۴ تا ۲۰ دقیقه</option>
        <option value="l"{% if dur == 'l' %} selected="selected"{% endif %}>بیشتر از ۲۰ دقیقه</option>
    </select>
    <select name="hq">
        <option value="All"{% if hq == 'All' or !dur %} selected="selected"{% endif %}>هر کیفیتی</option>
        <option value="h"{% if hq == 'h' %} selected="selected"{% endif %}>کیفیتی بالا</option>
    </select>
    <select name="qdr">
        <option value="All"{% if qdr == 'All' or !dur %} selected="selected"{% endif %}>هر زمانی</option>
        <option value="h"{% if qdr == 'h' %} selected="selected"{% endif %}>تا یک ساعت پیش</option>
        <option value="d"{% if qdr == 'd' %} selected="selected"{% endif %}>تا یک روز پیش</option>
        <option value="w"{% if qdr == 'w' %} selected="selected"{% endif %}>تا یک هفته پیش</option>
        <option value="m"{% if qdr == 'm' %} selected="selected"{% endif %}>تا یک ماه پیش</option>
        <option value="y"{% if qdr == 'y' %} selected="selected"{% endif %}>تا یک سال پیش</option>
    </select>
    <select name="website">
        <option value="All"{% if qdr == 'All' or !dur %} selected="selected"{% endif %}>هر سایتی</option>
        {% for item in websites %}
        <option value="{{ item.name|e }}"{% if website == item.name %} selected="selected"{% endif %}>{{ item.name|e }}</option>
        {% endfor %}
    </select>
</form>
{% if captcha %}
    <form method="post" action="{{ url.get(['for':'search', 'params':implode('/',[start, dur, hq, qdr, website, q])])|e }}">
        {% for name, value in hidden_items%}
        <input type="hidden" name="params[{{ name|e }}]" value="{{ value|e }}">
        {% endfor %}
        <p>
            لطفا برای ادامه کار کد امنیتی زیر را وارد نمایید.<br>
            <img src="{{ captcha_image }}"><br>
            <input type="text" name="code" placeholder="کد تصویر بالا"><br>
            <input type="submit" name="captcha" value="ادامه">
        </p>


    </form>
{% endif %}
{% if records|length %}
    <ul class="results">
    {% for record in records %}
        <li>
            {% if record.image %}
            <img src="{{ record.image }}">
            {% endif %}
            <h3>{{ record.title }}</h3>
            <div>{{ record.description }}</div>
            {% if record.duration %}
            <div class="inline">{{ record.duration }}</div>
            {% endif %}
            <div class="inline">{{ record.website }}</div>
            <div class="inline">{{ date.date('j F Y', record.date) }}</div>
            <a class="inline" href="{{ url.get(['for':'link', 'link':record.link])|e }}">دریافت</a>
        </li>
    {% endfor %}
    </ul>
{% endif %}
{% if have_next %}
    <a href="{{ url.get(['for':'search', 'params':implode('/',[last_item, dur, hq, qdr, website, q])])|e }}">صفحه بعدی</a>
{% endif %}