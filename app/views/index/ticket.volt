<div class="main-section">
    <div class="row text-center">
        {% if id > 0%}
        <h3>{{ ticket.title|e }} (<span class="status-{{ ticket.status|lower|e }}">{{ status[ticket.status]|e }}</span>)</h3>
        <ul class="list-unstyled">
        {% for record in ticket.getReplays(['order':'created_at']) %}
            <li>
                <div>
                    <div>
                        {% if !admin and record.getUser().role == 'Admin' %}
                            اپراتور
                        {% else %}
                            {{record.getUser().name|e }}
                        {% endif %}
                        ({{ record.getUser().getId()|e }})
                    </div>
                    <div>
                        {{ date.date('Y-m-d H:i:s', record.created_at|strtotime)|e }}
                    </div>
                </div>
                <div>
                    {{ record.content|e|nl2br }}
                </div>
            </li>
        {% endfor %}
        </ul>
    {% endif %}
    </div>
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
    <form class="search-bar" action="{{ url.get(['for':'ticket','id':id]) }}" method="post">
        {% if id > 0 and admin %}
        <p>
            <label for="status">عنوان: </label>
            <select id="status" name="status">
                <option value=""> --- </option>
                <option value="Open">باز</option>
                <option value="Answered">پاسخ داده شده</option>
                <option value="Replay">پاسخ کاربر</option>
                <option value="InProgress">در حال انجام</option>
                <option value="Closed">بسته شده</option>
            </select>
        </p>
        {% endif %}
        {% if !id %}
        <p>
            <label for="title">عنوان: </label>
            <input id="title" name="title" size="50" value="{{ request.getPost('title')|e }}">
        </p>
        {% endif %}
        <p>
            <label for="content">{% if id > 0 %}پاسخ{% else %}توضیحات{% endif %}: </label>
            <textarea id="content" name="content" cols="60" rows="10">{{ request.getPost('content')|e }}</textarea>
        </p>
        <p>
            <input type="submit" name="save" value="ثبت">
        </p>
    </form>
</div>