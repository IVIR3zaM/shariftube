<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>شریف تیوب - {{ title }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/kraken.css">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/font-awesome.css">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/style.css">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/main.css">
    </head>
    <body>
        <div class="container">
            <!-- Header -->
            <div class="row header">
                <div class="grid-full">
                    {% if dispatcher.getActionName() not in ['login', 'route404']%}
                        {{ partial("partials/header") }}
                    {% endif %}
                </div>
            </div>
            <!-- Main -->
            {% if dispatcher.getActionName() in ['login', 'route404'] %}
                {{ '<div class="row center-item">' }}
            {% else %}
                {{ '<div class="row">' }}
            {% endif %}
                <div class="float-center text-center">
                    <!-- Login -->
                    {{ content() }}
                </div>
            </div>
            <!-- Footer -->
            <div class="row footer">
                <div class="grid-full">
                    {% if dispatcher.getActionName() not in ['login', 'route404']%}
                        {{ partial("partials/footer") }}
                    {% endif %}
                </div>
            </div>
        </div>
        <script src="{{ url.getBaseUri() }}js/jquery.min.js"></script>
        <script src="{{ url.getBaseUri() }}js/leech.js"></script>
        <script src="{{ url.getBaseUri() }}js/kraken.js"></script>
        <script src="{{ url.getBaseUri() }}js/shariftube.js"></script>
    </body>
</html>