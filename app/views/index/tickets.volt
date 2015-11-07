<div class="main-section">
    {% if (flash.output()) %}
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <p class="alert alert-lg">{{ flash.output() }}</p>
        </div>
    </div>
    {% endif %}
    <div class="row text-center form-group">
        <ul class="list-unstyled list-inline">
            {% if !admin %}
            <!-- Should not be present when not admin -->
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'ticket']) }}">ارسال تیکت جدید</a></li>
            <!-- // -->
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/open']) }}">تمامی تیکت های باز</a></li>
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/all']) }}">تمامی تیکت ها</a></li>
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/closed']) }}">تمامی تیکت های بسته شده</a></li>
            {% else %}
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/open']) }}">تمامی تیکت های باز</a></li>
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/all']) }}">تمامی تیکت ها</a></li>
            <li><a class="btn btn-success btn-sm" href="{{ url.get(['for':'support','params':'1/closed']) }}">تمامی تیکت های بسته شده</a></li>
            {% endif %}
        </ul>
    </div>
</div>
<div class="form-group text-center">تعداد {{ page.total_items }} مورد موجود است.</div>
{% if page.items|length %}
<table class="table table-hover text-center">
    <tr>
        <th class="text-center">عنوان</th>
        {% if admin %}
        <th class="text-center">کاربر</th>
        {% endif %}
        <th class="text-center">وضعیت</th>
        <th class="text-center">آخرین جواب</th>
    </tr>
    {% for record in page.items %}
    <tr>
        <td>
            <a href="{{ url.get(['for':'ticket', 'id':record.id]) }}">
                {{ record.title|e }}
            </a>
        </td>
        {% if admin %}
        <td>
            {{ record.getUser().name|e }}({{ record.getUser().getId()|e }})
        </td>
        {% endif %}
        <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
        <td>{{ date.date('Y-m-d H:i:s', record.modified_at|strtotime)|e }}</td>
    </tr>
    {% endfor %}
</table>
{% endif %}
<div class="form-group text-center">درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
<div class="form-group btn-group-st row text-center">
    <a class="btn btn-info btn-sm {% if page.current == 1 %}disabled{% endif %}" href="{{ url.get(['for':'support']) }}">صفحه اول</a>
    <a class="btn btn-info btn-sm {% if page.current == page.before %}disabled{% endif %}" href="{{ url.get(['for':'support','params':implode('/',[page.before, dispatcher.getParam(1)|url_encode])]) }}"><i class="fa fa-chevron-right"></i> صفحه قبل</a>
    <a class="btn btn-info btn-sm {% if page.current == page.next %}disabled{% endif %}" href="{{ url.get(['for':'support','params':implode('/',[page.next, dispatcher.getParam(1)|url_encode])]) }}">صفحه بعد <i class="fa fa-chevron-left"></i></a>
    <a class="btn btn-info btn-sm {% if page.current == page.last %}disabled{% endif %}" href="{{ url.get(['for':'support','params':implode('/',[page.last, dispatcher.getParam(1)|url_encode])]) }}">صفحه آخر</a>
</div>