{{ flash.output() }}
{% if file_id > 0 %}
<div id="file-progress" rel="{{ file_id }}" class="progress-bar">
    <div class="bar" style="width: 0%;"></div>
    <div class="info">
        در انتظار دریافت فایل
    </div>
</div>
{% endif %}
<form class="params" action="{{ url.get(['for':'link']) }}" method="get">
    <label for="link">لینک ویدئو</label>
    <input id="link" data-encrypt="vinixhash" type="text" size="50" name="link" value="{{ link|e }}">
    <input type="submit" value="دریافت">
</form>
{% if records|length %}
    <h3>{{ label|e }}</h3>
    <table class="videos">
        <tr>
            <th>کیفیت</th>
            <th>نوع</th>
            <th>سه بعدی</th>
            <th>ظرفیت</th>
            <th>لینک</th>
        </tr>
    {% for record in records %}
        <tr>
            <td>{{ record.quality }}</td>
            <td>{{ record.type }}</td>
            <td>{% if record.is_3d %}بلی{% else %}خیر{% endif %}</td>
            <td>{{ number_format(record.size/1024/1024, 2) }} مگابایت</td>
            <td>
                <form method="post" action="{{ url.get(['for':'link', 'link':dispatcher.getParam('link')])|e }}">
                    <input type="hidden" name="params" value="{{ record.params|e }}">
                    <input type="submit" name="get" value="دریافت">
                </form>
            </td>
        </tr>
    {% endfor %}
    </table>
{% endif %}