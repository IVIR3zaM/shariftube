<div class="main-section">
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
    <form class="params search-bar" action="{{ url.get(['for':'search'])|e }}" method="get">
        <div class="search-extra-features form-group">
            <div class="row">
                <div class="col-xs-12 col-sm-3 select-item">
                    <select data-index="1" name="dur" class="form-control searchbar-select">
                        <option value="All"{% if dur == 'All' or !dur %} selected="selected"{% endif %}>هر دوره زمانی</option>
                        <option value="s"{% if dur == 's' %} selected="selected"{% endif %}>تا ۴ دقیقه</option>
                        <option value="m"{% if dur == 'm' %} selected="selected"{% endif %}>۴ تا ۲۰ دقیقه</option>
                        <option value="l"{% if dur == 'l' %} selected="selected"{% endif %}>بیشتر از ۲۰ دقیقه</option>
                    </select>
                </div>
                <div class="col-xs-12 col-sm-3 select-item">
                    <select data-index="2" name="hq" class="form-control searchbar-select">
                        <option value="All"{% if hq == 'All' or !dur %} selected="selected"{% endif %}>هر کیفیتی</option>
                        <option value="h"{% if hq == 'h' %} selected="selected"{% endif %}>کیفیت بالا</option>
                    </select>
                </div>
                <div class="col-xs-12 col-sm-3 select-item">
                    <select data-index="3" name="qdr" class="form-control searchbar-select">
                        <option value="All"{% if qdr == 'All' or !dur %} selected="selected"{% endif %}>هر زمانی</option>
                        <option value="h"{% if qdr == 'h' %} selected="selected"{% endif %}>تا یک ساعت پیش</option>
                        <option value="d"{% if qdr == 'd' %} selected="selected"{% endif %}>تا یک روز پیش</option>
                        <option value="w"{% if qdr == 'w' %} selected="selected"{% endif %}>تا یک هفته پیش</option>
                        <option value="m"{% if qdr == 'm' %} selected="selected"{% endif %}>تا یک ماه پیش</option>
                        <option value="y"{% if qdr == 'y' %} selected="selected"{% endif %}>تا یک سال پیش</option>
                    </select>
                </div>
                <div class="col-xs-12 col-sm-3 select-item">
                    <select data-index="4" name="website" class="form-control searchbar-select">
                        <option value="All"{% if qdr == 'All' or !dur %} selected="selected"{% endif %}>هر سایتی</option>
                        {% for item in websites %}
                        <option value="{{ item.name|e }}"{% if website == item.name %} selected="selected"{% endif %}>{{ item.name|e }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 searchbar-item">
                <input data-index="0" type="hidden" name="start" value="0">
                <div class="input-group form-group">
                    <input autofocus data-index="5" name="q" value="{{ q|e }}" type="text" class="form-control input-lg" placeholder="عبارتی را جستجو کنید">
                    <span class="input-group-btn">
                        <button class="btn btn-search">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
    </form>
    {% if captcha %}
    <form method="post" action="{{ url.get(['for':'search', 'params':implode('/',[start, dur, hq, qdr, website, q])])|e }}">
        {% for name, value in hidden_items%}
        <input type="hidden" name="params[{{ name|e }}]" value="{{ value|e }}">
        {% endfor %}
        <p>
            لطفا برای ادامه کار کد امنیتی زیر را وارد نمایید.<br>
            <img src="{{ captcha_image|e }}"><br>
            <input type="text" name="code" placeholder="کد تصویر بالا"><br>
            <input type="submit" name="captcha" value="ادامه">
        </p>
    </form>
    {% endif %}
    {% if records|length %}
    <ul class="list-unstyled list-records row">
        {% for record in records %}
        <li class="col-md-6 col-sm-12">
            <div class="record clearfix">
                <div class="record-details">
                    <h3 class="record-title">{{ record.title }}</h3>
                    <p class="record-desc">{{ record.description }}</p>
                    <!-- Add if record.duration -->
                    <time class="record-duration"><i class="fa fa-clock-o"></i> {{ record.duration }}</time>
                    <div class="record-website">
                        {% if record.website == "Youtube" %}
                        <i class="fa fa-youtube"></i>
                        {% elseif record.website == "Vimeo" %}
                        <i class="fa fa-vimeo-square"></i>
                        {% else %}
                        <i class="fa home"></i>
                        {% endif %}
                        {{ record.website }}</div>
                        <date class="record-date"><i class="fa fa-calendar"></i> {{ date.date('j F Y', record.date) }}</date>
                        <a class="btn btn-primary record-link" href="{{ url.get(['for':'link', 'link':record.link])|e }}"><i class="fa fa-download"></i> دریافت</a>
                    </div>
                    <div class="record-thumb">
                        <!-- Add if record.image -->
                        <img src="{{ record.image }}">
                    </div>
                </div>
            </li>
        {% endfor %}
    </ul>
    {% endif %}
    {% if have_next %}
        <div class="row form-group text-center">
            <a class="btn btn-info" href="{{ url.get(['for':'search', 'params':implode('/',[last_item, dur, hq, qdr, website, q])])|e }}">صفحه بعدی <i class="fa fa-chevron-left"></i></a>
        </div>
    {% endif %}
</div>