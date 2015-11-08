{{ flash.output() }}
{% if file %}
<div data-link="{{ file|e }}" id="player">Loading the player...</div>
{% endif %}