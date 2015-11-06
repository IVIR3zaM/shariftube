<div class="main-section">
    <div class="row text-center">
        {% if id > 0%}
        <h3>{{ ticket.title|e }} (<span class="status-{{ ticket.status|lower|e }}">{{ status[ticket.status]|e }}</span>)</h3>
        <ul class="list-unstyled list-ticket">
        {% for record in ticket.getReplays(['order':'created_at']) %}
            <li>
                <div>
                    <div>
                        <div class="form-group">
                            {% if !admin and record.getUser().role == 'Admin' %}
                                اپراتور
                            {% else %}
                                {{record.getUser().name|e }}
                            {% endif %}
                            ({{ record.getUser().getId()|e }})
                        </div>
                        <div class="form-group">
                            {{ date.date('Y-m-d H:i:s', record.created_at|strtotime)|e }}
                        </div>
                    </div>
                    <div class="form-group">
                        {{ record.content|e|nl2br }}
                    </div>
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
    <form class="search-bar form-horizontal" action="{{ url.get(['for':'ticket','id':id]) }}" method="post">
        {% if id > 0 and admin %}
        <p class="form-group">
            <label for="status" class="control-label">وضعیت تیکت: </label>
            <select class="form-control" style="display: inline" id="status" name="status">
                <option value=""> انتخاب عنوان </option>
                <option value="Open">باز</option>
                <option value="Answered">پاسخ داده شده</option>
                <option value="Replay">پاسخ کاربر</option>
                <option value="InProgress">در حال انجام</option>
                <option value="Closed">بسته شده</option>
            </select>
        </p>
        {% endif %}
        {% if !id %}
        <p class="form-group">
            <label class="control-label" for="title">عنوان: </label>
            <input class="form-control" id="title" name="title" size="50" value="{{ request.getPost('title')|e }}">
        </p>
        {% endif %}
        <p class="form-group">
            <label class="control-label" for="content">{% if id > 0 %}پاسخ{% else %}توضیحات{% endif %}: </label>
            <textarea class="form-control" id="content" name="content" cols="60" rows="10">{{ request.getPost('content')|e }}</textarea>
        </p>
        <p class="form-group">
            <input class="btn btn-primary btn-block" type="submit" name="save" value="ثبت">
            <input class="btn btn-danger btn-block" type="submit" name="close" value="بستن تیکت">
        </p>
    </form>
</div>