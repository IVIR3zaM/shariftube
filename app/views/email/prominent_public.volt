<div style="margin-bottom:20px;">
    <p>
        آخرین ویدئوهای برجسته دانلود شده توسط کاربران در لیست زیر برای دانلود رایگان در اختیار شماست<br>
    </p>
    <table>
        <thead>
        <tr>
            <th>نام</th>
            <th>حجم</th>
        </tr>
        </thead>
        <tbody>
        {% for prominent in prominents %}
        <tr>
            <td>{{ prominent.label|e }}</td>
            <td>{{ number_format(prominent.size/1024/1024, 2) }}MB</td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
    <div style="line-height:30px;">
        <p>برای دانلود رایگان این فایل ها به آدرس <span style="direction:ltr"><a
                style="color:#257fa9;margin:0 5px;display:inline-block" href="https://shariftube.ir/login/?#signup"
                title="ثبت نام در سرویس شریف تیوب">https://shariftube.ir/login/?#signup</a></span> مراجعه نموده و با استفاده
            از کد معرف <span style="display:inline-block;direction:ltr;margin:0 5px;color:#dc5d5d"><strong>Sharifi</strong></span>
            ثبت نام نمایید.
        </p>
    </div>
</div>
<div>
    <p style="direction: ltr;">
        <a style="color:#0D3635" href="https://shariftube.ir/">https://shariftube.ir/</a>
    </p>
</div>