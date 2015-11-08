{{ flash.output() }}
{% if file %}
<div data-link="{{ file|e }}" class="player"></div>
<div id="player">درحال بارگزاری</div>
{% endif %}