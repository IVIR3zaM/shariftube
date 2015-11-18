{{ flash.output() }}
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
{% endif %}