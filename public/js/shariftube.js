// Tab
var tabHandler = function(config_obj) {
	// Obj must have a holder and could have timing.
	var duration = 200;
	if (config_obj.duration) {
		duration = config_obj.duration;
	}
	var holder = $('[data-tab-holder = ' + config_obj.holder + ']');
	$('button, a', holder).click(function(e) {
		var self = $(this);
		e.preventDefault();
		var role = self.attr('data-tab-trigger') || undefined,
		role_obj = $('[data-tab-role = ' + role + ']'),
		active = $('[data-tab-role].active', holder);
		active.fadeOut(duration, function(){
			active.removeClass('active');
			role_obj.fadeIn(duration).addClass('active');
		});
	});
}

// Alert
var alertHandler = function() {
	$('.alert').click(function() {
		$(this).fadeOut(200);
	});
}

// Init
$(document).ready(function() {
	tabHandler({
		holder: 'login-tab',
		duration: 200
	});
	alertHandler();
});