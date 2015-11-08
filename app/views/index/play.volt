{{ flash.output() }}
{% if file %}
<div id="myElement">Loading the player...</div>
<script type="text/javascript">
	setTimeout($(function () {
		var playerInstance = jwplayer("myElement");
		playerInstance.setup({
			file: "{{ file|e }}",
			width: "100%",
			aspectratio: "16:9"
		});
	}), 5000);
</script>
</div>
{% endif %}