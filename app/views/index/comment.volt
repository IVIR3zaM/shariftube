<!-- {{ flash.output() }}
{% if comment_form %}
<form action="{{ url.get(['for':'comment','auth':auth])|e }}" method="post">
    <div style="margin: 10px auto">
        <label>دیدگاه شما</label>
        <div style="margin: 10px auto">
            <textarea name="comment" cols="50" rows="10"></textarea>
        </div>
    </div>
    <div style="margin: 10px auto">
        <input type="submit" value="ارسال">
    </div>
</form>
{% endif %}
{% if home_link %}
<p>
    <a href="{{ url.get(['for':'home']) }}">بازگشت به صفحه اصلی</a>
</p>
{% endif %} -->

<div class="main-section">
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
    <form class="params search-bar" action="{{ url.get(['for':'comment','auth':auth])|e }}" method="post">
        <div class="row form-group">
            <div class="col-xs-12 form-group text-center">
                <label for="comment"><h3>دیدگاه شما</h3></label>
            </div>
            <div class="col-xs-12 text-center">
                <textarea name="comment" cols="50" rows="8"></textarea>
            </div>
        </div>
        <div class="text-center">
            <input class="btn btn-primary btn-lg" type="submit" value="ارسال">
        </div>
    </form>
    {% if home_link %}
    <p>
        <a href="{{ url.get(['for':'home']) }}">بازگشت به صفحه اصلی</a>
    </p>
    {% endif %}
</div>