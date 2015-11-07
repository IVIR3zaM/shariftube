<div class="main-section">
    <div class="form-group text-center">تعداد {{ page.total_items }} مورد موجود است.</div>
    {% if page.items|length %}
    <table class="table table-hover text-center">
        <tr>
            <th class="text-center">نام پکیج</th>
            <th class="text-center">مبلغ (تومان)</th>
            <th class="text-center">ظرفیت</th>
            <th class="text-center">تاریخ</th>
            <th class="text-center">وضعیت</th>
        </tr>
        {% for record in page.items %}
        <tr>
            <td>{{ packages[record.package_id].label|e }}</td>
            <td>{{ number_format(packages[record.package_id].price/10, 0) }}</td>
            <td>{{ number_format(packages[record.package_id].quota/1024/1024/1024, 2) }}GB</td>
            <td>{{ date.date('Y-m-d H:i:s', record.created_at|strtotime)|e }}</td>
            <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
        </tr>
        {% endfor %}
    </table>
    {% endif %}
    <div class="form-group text-center">درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
    <div class="row text-center form-group btn-group-st">
        <a class="btn btn-info btn-sm {% if page.current == 1 %}disabled{% endif %}" href="{{ url.get(['for':'purchases']) }}">صفحه اول</a>
        <a class="btn btn-info btn-sm {% if page.current == page.before %}disabled{% endif %}" href="{{ url.get(['for':'purchases','page':page.before]) }}"><i class="fa fa-chevronright"></i> صفحه قبل</a>
        <a class="btn btn-info btn-sm {% if page.current == page.next %}disabled{% endif %}" href="{{ url.get(['for':'purchases','page':page.next]) }}">صفحه بعد <i class="fa fa-chevron-left"></i></a>
        <a class="btn btn-info btn-sm {% if page.current == page.last %}disabled{% endif %}" href="{{ url.get(['for':'purchases','page':page.last]) }}">صفحه آخر</a>
    </div>
</div>