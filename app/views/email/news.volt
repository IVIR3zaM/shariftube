<div style="text-align:right;margin-bottom:20px;">
    <h4>{{ name|e }} گرامی </h4>
</div>
<div style="margin-bottom:20px;">
    <p>
        آخرین اخبار شریف تیوب بدین صورت می باشند:
    </p>
    <ul>
        {% for record in announcements %}
        <li>
            <h3>{{ record.title|e }}</h3>
            <p>
                {{ record.content|e|nl2br }}
            </p>
        </li>
        {% endfor %}
    </ul>
</div>
<div>
    <p>
        <a style="color:#0D3635" href="https://shariftube.ir/unsubscribe/{{ hash|e }}">حذف ایمیل شما از خبرنامه</a>
    </p>
    <p style="direction: ltr;">
        <a style="color:#0D3635" href="https://shariftube.ir/">https://shariftube.ir/</a>
    </p>
</div>