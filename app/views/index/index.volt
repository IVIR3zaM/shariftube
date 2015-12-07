<div class="main-section">
    <div>
        <div class="clearfix">
            <div class="col-xs-6 col-xs-offset-3">
                <div class="alert-lg">{{ flash.output() }}</div>
            </div>
        </div>
    </div>
    {% if file_id > 0 %}
    <div class="row">
        <div id="file-progress" rel="{{ file_id }}" class="col-xs-6 col-xs-offset-3">
            <div class="bar" style="width: 0%;"></div>
            <div class="info">
                در انتظار دریافت فایل
            </div>
        </div>
    </div>
    {% endif %}
    <div class="row">
        <div class="col-xs-12 searchbar-item">
            <form class="params search-bar" action="{{ url.get(['for':'link'])|e }}" method="get">
                <div class="input-group form-group">
                    <input id="link" data-encrypt="vinixhash" type="text" class="form-control input-lg" name="link" placeholder="لینک ویدیو مورد نظر را واردنمایید" value="{{ link|e }}">
                    <span class="input-group-btn">
                        <button class="btn btn-search">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </div>
    {% if records|length %}
    <div class="row text-center form-group">
        <h3>{{ label|e }}</h3>
        {% if thumb %}
        <img width="145" src="{{ thumb|e }}">
        {% endif %}
        <table class="table table-hover">
            <tr>
                <th>کیفیت</th>
                <th>نوع</th>
                <th>سه بعدی</th>
                <th>ظرفیت</th>
                <th>لینک</th>
                <th>پیش نمایش</th>
            </tr>
        {% for record in records %}
            <tr>
                <td>{{ record.quality|e }}</td>
                <td>{{ record.type|e }}</td>
                <td>{% if record.is_3d %}بلی{% else %}خیر{% endif %}</td>
                <td>{{ number_format(record.size/1024/1024, 2) }} مگابایت</td>
                <td>
                    <form method="post" action="{{ url.get(['for':'link', 'link':dispatcher.getParam('link')])|e }}">
                        <input type="hidden" name="params" value="{{ record.params|e }}">
                        <input class="btn btn-primary btn-sm" type="submit" name="get" value="دریافت">
                    </form>
                </td>
                <td>
                {% if record.trailer %}    
                    <a download href="{{ record.trailer|e }}" class="player btn btn-info">پیش نمایش</a>
                {% else %}
                    ندارد
                {% endif %}
                </td>
            </tr>
        {% endfor %}
        </table>
    </div>
    {% endif %}
    {% if suggestions|length %}
    <h4 class="text-center bg-white well">ویدئو های مشابه</h4>
    <ul class="list-unstyled list-records row">
        {% for record in suggestions %}
        <li class="col-md-6 col-sm-12">
            <div class="record clearfix">
                <div class="record-details">
                    <h3 class="record-title">{{ record.title }}</h3>
                    {% if record.description %}
                    <p class="record-desc">{{ record.description }}</p>
                    {% endif %}

                    <!-- Add if record.duration -->
                    {% if record.duration %}
                    <time class="record-duration"><i class="fa fa-clock-o"></i> {{ record.duration }}</time>
                    {% endif %}

                    <div class="record-website">
                        {% if record.website == "Youtube" %}
                        <i class="fa fa-youtube"></i>
                        {% elseif record.website == "Vimeo" %}
                        <i class="fa fa-vimeo-square"></i>
                        {% else %}
                        <i class="fa home"></i>
                        {% endif %}
                        {{ record.website }}</div>

                    {% if record.date %}
                    <date class="record-date"><i class="fa fa-calendar"></i> {{ date.date('j F Y', record.date) }}</date>
                    {% endif %}
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
</div>