<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sharif Tube - {{ title }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ url.getBaseUri() }}css/style.css">
    </head>
    <body>
        {% if dispatcher.getActionName() not in ['login', 'route404']%}
            {% include "partials/header.volt" %}
        {% endif %}
		{{ content() }}
        {% if dispatcher.getActionName() not in ['login', 'route404']%}
            {% include "partials/footer.volt" %}
        {% endif %}
        <script src="{{ url.getBaseUri() }}js/jquery.js"></script>
        <script src="{{ url.getBaseUri() }}js/leech.js"></script>
    </body>
</html>