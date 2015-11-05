<div class="main-section">
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
</div>
{% if records|length %}
<div class="row">
    <ul class="list-unstyled row flex flex-reverse list-shop">
        {% for record in records %}
        <li class="col-md-3 col-sm-6 col-xs-12">
            <form class="bg-white text-center" action="{{ url.get(['for':'shop'])|e }}" method="post">
                <input type="hidden" name="id" value="{{ record.id|e }}">
                <div class="form-group"><h2>{{ record.label|e }}</h2></div>
                <div class="form-group text-en text-ltr text-danger"><h4>{{ number_format(record.quota/1024/1024/1024, 2) }} GB</h4></div>
                <div class="form-group"><h4>{{ number_format(record.price/10, 0) }} تومان</h4></div>
                <button class="btn btn-success btn-block" type="submit"><i class="fa fa-shopping-cart"></i> خرید</button>
            </form>
        </li>
        {% endfor %}
    </ul>
</div>
{% endif %}