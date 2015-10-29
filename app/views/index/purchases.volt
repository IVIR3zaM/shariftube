<div>تعداد {{ page.total_items }} مورد موجود است.</div>
{% if page.items|length %}
<table>
    <tr>
        <th>نام پکیج</th>
        <th>مبلغ (تومان)</th>
        <th>ظرفیت</th>
        <th>تاریخ</th>
        <th>وضعیت</th>
    </tr>
    {% for record in page.items %}
    <tr>
        <td>{{ packages[record.package_id].label|e }}</td>
        <td>{{ number_format(packages[record.package_id].price/10, 0) }}</td>
        <td>{{ number_format(packages[record.package_id].quota/1024/1024/1024, 2) }}GB</td>
        <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
    </tr>
    {% endfor %}
</table>
{% endif %}
<div>درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
<a {% if page.current == 1 %}class="disabled" {% endif %}href="{{ url.get(['for':'purchases']) }}">صفحه اول</a>
<a {% if page.current == page.before %}class="disabled" {% endif %}href="{{ url.get(['for':'purchases','params':page.before]) }}">صفحه قبل</a>
<a {% if page.current == page.next %}class="disabled" {% endif %}href="{{ url.get(['for':'purchases','params':page.next]) }}">صفحه بعد</a>
<a {% if page.current == page.last %}class="disabled" {% endif %}href="{{ url.get(['for':'purchases','params':page.last]) }}">صفحه آخر</a>