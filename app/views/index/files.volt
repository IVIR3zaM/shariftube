<div class="main-section">
    <div class="popup-video">
        <a href="#" class="close"><i class="fa fa-times"></i></a>
        <div id="player">درحال بارگزاری</div>
    </div>
    <form class="params search-bar" method="get" action="{{ url.get(['for':'files']) }}">
        <input type="hidden" name="page" value="1">
        <div class="input-group form-group">
            <input placeholder="جستجو در لیست ویدیوها" type="text" class="form-control input-lg" name="name" id="name" value="{{ dispatcher.getParam(1)|e }}">
            <span class="input-group-btn">
                <button class="btn btn-search">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </form>
    <div class="text-center form-group">تعداد {{ page.total_items }} مورد موجود است.</div>
    {% if page.items|length %}
        <table class="table text-hover">
            <tr>
                <th>نام فایل</th>
                <th>ظرفیت</th>
                <th>کیفیت</th>
                <th>وضعیت</th>
                <th>تاریخ دریافت</th>
                <th>تنظیمات</th>
            </tr>
            {% for record in page.items %}
            <tr>
                <td>{{ record.label|e }}</td>
                <td>{{ number_format(record.size/1024/1024, 2) }}MB</td>
                <td>{{ record.quality|e }}</td>
                <td class="status-{{ record.status|lower|e }}">{{ status[record.status]|e }}</td>
                <td>{{ date.date('Y-m-d H:i:s', record.created_at|strtotime)|e }}</td>
                <td>
                    {% if record.status == 'Success' and servers[record.server_id] is defined %}
                    <a href="{{ record.getFinalLink()|e }}">دانلود</a> | 
                    <a href="{{ url.get(['for':'play','id':record.id|e]) }}">پخش</a> | 
                    {% endif %}
                    <a href="{{ url.get(['for':'link','link':record.uri|vinixhash_encode]) }}">دریافت مجدد</a>
                </td>
            </tr>
            {% endfor %}
        </table>
    {% endif %}
    <div class="text-center form-group">درحال نمایش صفحه {{ page.current }} از {{ page.total_pages }}</div>
    <div class="row text-center form-group btn-group-st">
        <a class="btn btn-info btn-sm {% if page.current == 1 %}disabled{% endif %}" href="{{ url.get(['for':'files']) }}">صفحه اول</a>
        <a class="btn btn-info btn-sm {% if page.current == page.before %}disabled{% endif %}" href="{{ url.get(['for':'files','params':implode('/',[page.before, dispatcher.getParam(1)|url_encode])]) }}"><i class="fa fa-chevron-right"></i> صفحه قبل</a>
        <a class="btn btn-info btn-sm {% if page.current == page.next %}disabled{% endif %}" href="{{ url.get(['for':'files','params':implode('/',[page.next, dispatcher.getParam(1)|url_encode])]) }}">صفحه بعد <i class="fa fa-chevron-left"></i></a>
        <a class="btn btn-info btn-sm{% if page.current == page.last %}disabled{% endif %}" href="{{ url.get(['for':'files','params':implode('/',[page.last, dispatcher.getParam(1)|url_encode])]) }}">صفحه آخر</a>
    </div>
</div>