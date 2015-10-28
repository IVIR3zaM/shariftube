{{ flash.output() }}
{% if records|length %}
    <table>
        <tr>
            <th>نام فایل</th>
            <th>ظرفیت</th>
            <th>کیفیت</th>
            <th>وضعیت</th>
            <th>تاریخ دریافت</th>
            <th>دانلود</th>
        </tr>
        {% for record in records %}
        <tr>
            <td>{{ record.label|e }}</td>
            <td>{{ number_format(record.size/1024/1024, 2) }}MB }}</td>
            <td>{{ record.quality|e }}</td>
            <td>{{ record.status|e }}</td>
            <td>{{ record.created_at|e }}</td>
            <td></td>
        </tr>
        {% endfor %}
    </table>
{% endif %}