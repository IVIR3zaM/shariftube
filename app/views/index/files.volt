<form class="params" method="get" action="{{ url.get(['for':'files']) }}">
    <input type="hidden" name="page" value="1">
    <label for="name">نام فایل</label>
    <input type="text" name="name" id="name" value="{{ dispatcher.getParam(1)|e }}">
    <input type="submit" value="جست و جو">
</form>
<div>تعداد {{ page.total_items }} مورد موجود است.</div>
{% if page.items|length %}
    <table>
        <tr>
            <th>نام فایل</th>
            <th>ظرفیت</th>
            <th>کیفیت</th>
            <th>وضعیت</th>
            <th>تاریخ دریافت</th>
            <th>دانلود</th>
        </tr>
        {% for record in page.items %}
        <tr>
            <td>{{ record.label|e }}</td>
            <td>{{ number_format(record.size/1024/1024, 2) }}MB</td>
            <td>{{ record.quality|e }}</td>
            <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
            <td>{{ date.date('Y-m-d H:i:s', record.created_at|strtotime)|e }}</td>
            <td>
                {% if record.status == 'Success' and servers[record.server_id] is defined %}
                <a href="{{ record.getFinalLink()|e }}">دانلود</a>
                {% else %}
                -
                {% endif %}
            </td>
        </tr>
        {% endfor %}
    </table>
{% endif %}
<div>درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
<a {% if page.current == 1 %}class="disabled" {% endif %}href="{{ url.get(['for':'files']) }}">صفحه اول</a>
<a {% if page.current == page.before %}class="disabled" {% endif %}href="{{ url.get(['for':'files','params':implode('/',[page.before, dispatcher.getParam(1)|url_encode])]) }}">صفحه قبل</a>
<a {% if page.current == page.next %}class="disabled" {% endif %}href="{{ url.get(['for':'files','params':implode('/',[page.next, dispatcher.getParam(1)|url_encode])]) }}">صفحه بعد</a>
<a {% if page.current == page.last %}class="disabled" {% endif %}href="{{ url.get(['for':'files','params':implode('/',[page.last, dispatcher.getParam(1)|url_encode])]) }}">صفحه آخر</a>