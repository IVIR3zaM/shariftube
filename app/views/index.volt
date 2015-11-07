<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta name="robots" content="noindex, nofollow"/>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>شریف تیوب - {{ title }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/bootstrap.min.css">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/font-awesome.css">
        <!-- <link rel="stylesheet" href="{{ url.getBaseUri() }}css/style.css"> -->
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/main.css">
    </head>
    <body>
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
                <!-- Cloding the in condition DIV -->
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
        <script src="{{ url.getBaseUri() }}js/jquery.min.js"></script>
        <script src="{{ url.getBaseUri() }}js/leech.js"></script>
        <script src="{{ url.getBaseUri() }}js/bootstrap.min.js"></script>
        <script src="{{ url.getBaseUri() }}js/shariftube.js"></script>
    </body>
</html>