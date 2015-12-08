<div class="main-section">
    {% if videos|length %}
    <h4 class="text-center bg-white well">ویدئو های پیشنهادی ما به شما (دریافت به صورت نیم بها)</h4>
    <ul class="list-unstyled list-records row">
        {% for record in videos %}
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
                    <a class="btn btn-primary record-link" href="{{ url.get(['for':'click', 'id':record.id])|e }}"><i class="fa fa-download"></i> دریافت</a>
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