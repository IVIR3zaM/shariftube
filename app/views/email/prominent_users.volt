<div style="text-align:right;margin-bottom:20px;">
    <h4>{{ name|e }} گرامی </h4>
</div>
<div style="margin-bottom:20px;">
    <p>
        آخرین ویدئوهای برجسته دانلود شده توسط کاربران در لیست زیر برای دانلود رایگان در اختیار شماست<br>
        <table>
            <thead>
            <tr>
                <th>نام</th>
                <th>حجم</th>
                <th>دانلود</th>
            </tr>
            </thead>
            <tbody>
            {% for prominent in prominents %}
            <tr>
                <td>{{ prominent.label|e }}</td>
                <td>{{ number_format(prominent.size/1024/1024, 2) }}MB</td>
                <td><a href="{{ prominent.getFinalLink()|e }}">دانلود</a></td>
            </tr>
            {% endfor %}
            </tbody>
        </table>
    </p>
</div>
<div>
    <p>
        <a style="color:#0D3635" href="{{ unsubscribe|e }}">حذف ایمیل شما از خبرنامه</a>
    </p>
    <p style="direction: ltr;">
        <a style="color:#0D3635" href="https://shariftube.ir/">https://shariftube.ir/</a>
    </p>
</div>