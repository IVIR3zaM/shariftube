{{ flash.output() }}
{% if records|length %}
    <ul class="packages">
        {% for record in records %}
        <li>
            <form action="{{ url.get(['for':'shop'])|e }}" method="post">
                <input type="hidden" name="id" value="{{ record.id|e }}">
                <div>{{ record.label|e }}</div>
                <div>{{ number_format(record.quota/1024/1024/1024, 2) }}GB</div>
                <div>{{ number_format(record.price/10, 0) }} تومان</div>
                <button type="submit">خرید</button>
            </form>
        </li>
        {% endfor %}
    </ul>
{% endif %}