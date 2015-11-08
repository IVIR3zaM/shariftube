{{ flash.output() }}
{% if file %}
<div data-link="{{ file|e }}" class="player">Loading the player...</div>
<div id="player">Loading the player...</div>
{% endif %}