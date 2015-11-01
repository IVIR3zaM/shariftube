{% if announcements|length %}
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
{% endif %}
<div>
    گروه نرم افزاری وینیکس
</div>