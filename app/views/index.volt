<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta name="robots" content="noindex, nofollow"/>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>شریف تیوب - {{ title }}</title>
        <meta name="description" content="شریف تیوب، سرویسی برای استفاده آکادمیک و آموزشی با هدف آسان سازی ارتباط با شبکه های ویدیویی وب">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/shariftube1446995875760.min.css">
    </head>
    <body>
    	<noscript><div style="position:fixed;width:100%;height:100%;background-color:#000;color:#fff;z-index:1000000000"><h1 style="position:absolute;top:50%;left:50%;-webkit-transform:translate3d(-50%,-50%,0);transform:translate3d(-50%,-50%,0);text-align:center;">کاربر گرامی، جاوااسکریپت مرورگر شما غیرفعال است. برای استفاده از این سرویس لطفا جاوااسکریپت مرورگر خود را فعال نمایید.</h1></div></noscript>
        <div class="container-fluid">
            <!-- Header -->
            <div class="row header">
                <div class="col-xs-12">
                    {% if dispatcher.getActionName() not in ['login', 'route404']%}
                        {{ partial("partials/header") }}
                    {% endif %}
                </div>
            </div>
            <!-- Main -->
            <div class="container main-container">
                {% if dispatcher.getActionName() in ['login', 'route404'] %}
                    {{ '<div class="row center-item">' }}
                {% else %}
                    {{ '<div class="row dashboard-state">' }}
                {% endif %}
                <div class="col-xs-12">
                    {{ content() }}
                </div>
                <!-- Prominent Video -->
                {% if prominents %}
                <div class="prominents">
                    <table class="table table-prominents">
                        <thead>
                            <tr>
                                <th colspan="3">برخی ویدئوهای دانلود شده کاربران</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for prominent in prominents %}
                            <tr>
                                <td class="prominent-title popover" data-toggle="popover" data-trigger="hover" data-content="{{ prominent.label|e }}">{{ prominent.short_label|e }}</td>
                                <td class="prominent-volume">{{ number_format(prominent.size/1024/1024, 2) }}</td>
                                <td><a class="btn btn-primary btn-sm" href="{{ prominent.getFinalLink()|e }}">دانلود</a> | </td>
                            </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>
                {% endif %}
                <!-- Closing the in condition DIV -->
                </div>
            </div>
            <!-- Footer -->
	        <div class="footer row">
	            <div class="col-xs-12">
	                {% if dispatcher.getActionName() not in ['login', 'route404']%}
	                {{ partial("partials/footer") }}
	                {% endif %}
	            </div>
	        </div>
        </div>
        <script defer src="{{ url.getBaseUri() }}js/shariftube1446995875760.min.js"></script>
    </body>
</html>