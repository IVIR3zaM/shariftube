{{ flash.output() }}
<ul>
    {% if !admin %}<li><a href="{{ url.get(['for':'ticket']) }}">ارسال تیکت جدید</a></li>{% endif %}
    <li><a href="{{ url.get(['for':'support','params':'1/open']) }}">تمامی تیکت های باز</a></li>
    <li><a href="{{ url.get(['for':'support','params':'1/all']) }}">تمامی تیکت ها</a></li>
    <li><a href="{{ url.get(['for':'support','params':'1/closed']) }}">تمامی تیکت های بسته شده</a></li>
</ul>
<div>تعداد {{ page.total_items }} مورد موجود است.</div>
{% if page.items|length %}
<table>
    <tr>
        <th>عنوان</th>
        {% if admin %}
        <th>کاربر</th>
        {% endif %}
        <th>وضعیت</th>
        <th>آخرین جواب</th>
    </tr>
    {% for record in page.items %}
    <tr>
        <td>
            <a href="{{ url.get(['for':'ticket', 'id':record.id]) }}">
                {{ record.title|e }}
            </a>
        </td>
        {% if admin %}
        <td>
            {{ record.getUser().name|e }}({{ record.getUser().getId()|e }})
        </td>
        {% endif %}
        <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
        <td>{{ date.date('Y-m-d H:i:s', record.modified_at|strtotime)|e }}</td>
    </tr>
    {% endfor %}
</table>
{% endif %}
<div>درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
<a {% if page.current == 1 %}class="disabled" {% endif %}href="{{ url.get(['for':'support']) }}">صفحه اول</a>
<a {% if page.current == page.before %}class="disabled" {% endif %}href="{{ url.get(['for':'support','params':implode('/',[page.before, dispatcher.getParam(1)|url_encode])]) }}">صفحه قبل</a>
<a {% if page.current == page.next %}class="disabled" {% endif %}href="{{ url.get(['for':'support','params':implode('/',[page.next, dispatcher.getParam(1)|url_encode])]) }}">صفحه بعد</a>
<a {% if page.current == page.last %}class="disabled" {% endif %}href="{{ url.get(['for':'support','params':implode('/',[page.last, dispatcher.getParam(1)|url_encode])]) }}">صفحه آخر</a>