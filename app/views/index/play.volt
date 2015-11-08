{{ flash.output() }}
{% if file %}
<div id="myElement">Loading the player...</div>
<script type="text/javascript">
	$(function () {
		var playerInstance = jwplayer("myElement");
		playerInstance.setup({
			file: "{{ file|e }}",
			width: "100%",
			aspectratio: "16:9"
		});
	});
</script>
</div>
{% endif %}