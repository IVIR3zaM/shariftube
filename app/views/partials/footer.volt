<div class="navbar navbar-footer row">
    <div class="col-md-4 col-sm-4 col-xs-12 navbar-footer-support">
        <ul class="list-unstyled list-inline text-center">
            <li><span class="support-item"><i class="fa fa-youtube"></i></span></li>
            <li><span class="support-item"><i class="fa fa-vimeo-square"></i></span></li>
        </ul>
    </div>
    {% if announcements|length %}
    <div class="col-md-5 col-sm-8 col-xs-12 carousel slide" data-ride="carousel" id="footer-carousel">
        <ul class="list-unstyled list-announcement carousel-inner" role="listbox">
            {% for record in announcements %}
            <li class="item {% if loop.first %}active{% endif %}">
                <h3>{{ record.title|e }}</h3>
                <p>
                    {{ record.content|e|nl2br }}
                </p>
            </li>
            {% endfor %}
        </ul>
        {% if announcements|length > 1 %}
        <a class="left carousel-control" href="#footer-carousel" role="button" data-slide="prev">
            <span class="glyphicon-chevron-left fa fa-chevron-left" aria-hidden="true"></span>
        </a>
        <a class="right carousel-control" href="#footer-carousel" role="button" data-slide="next">
            <span class="glyphicon-chevron-right fa fa-chevron-right" aria-hidden="true"></span>
        </a>
        {% endif %}
    </div>
    <div class="col-md-3 col-sm-12 col-xs-12 copyright">
        <p class="center-block text-center">&copy;گروه نرم افزاری وینیکس</p>
    </div>
    {% else %}
    <div class="col-md-3 col-md-offset-5 col-sm-12 col-xs-12 copyright">
        <p class="center-block text-center">&copy;گروه نرم افزاری وینیکس</p>
    </div>
    {% endif %}
</div>