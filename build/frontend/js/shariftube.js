// Jquery easing
jQuery.easing.jswing=jQuery.easing.swing;jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(e,f,a,h,g){return jQuery.easing[jQuery.easing.def](e,f,a,h,g)},easeInQuad:function(e,f,a,h,g){return h*(f/=g)*f+a},easeOutQuad:function(e,f,a,h,g){return -h*(f/=g)*(f-2)+a},easeInOutQuad:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f+a}return -h/2*((--f)*(f-2)-1)+a},easeInCubic:function(e,f,a,h,g){return h*(f/=g)*f*f+a},easeOutCubic:function(e,f,a,h,g){return h*((f=f/g-1)*f*f+1)+a},easeInOutCubic:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f+a}return h/2*((f-=2)*f*f+2)+a},easeInQuart:function(e,f,a,h,g){return h*(f/=g)*f*f*f+a},easeOutQuart:function(e,f,a,h,g){return -h*((f=f/g-1)*f*f*f-1)+a},easeInOutQuart:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f+a}return -h/2*((f-=2)*f*f*f-2)+a},easeInQuint:function(e,f,a,h,g){return h*(f/=g)*f*f*f*f+a},easeOutQuint:function(e,f,a,h,g){return h*((f=f/g-1)*f*f*f*f+1)+a},easeInOutQuint:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f*f+a}return h/2*((f-=2)*f*f*f*f+2)+a},easeInSine:function(e,f,a,h,g){return -h*Math.cos(f/g*(Math.PI/2))+h+a},easeOutSine:function(e,f,a,h,g){return h*Math.sin(f/g*(Math.PI/2))+a},easeInOutSine:function(e,f,a,h,g){return -h/2*(Math.cos(Math.PI*f/g)-1)+a},easeInExpo:function(e,f,a,h,g){return(f==0)?a:h*Math.pow(2,10*(f/g-1))+a},easeOutExpo:function(e,f,a,h,g){return(f==g)?a+h:h*(-Math.pow(2,-10*f/g)+1)+a},easeInOutExpo:function(e,f,a,h,g){if(f==0){return a}if(f==g){return a+h}if((f/=g/2)<1){return h/2*Math.pow(2,10*(f-1))+a}return h/2*(-Math.pow(2,-10*--f)+2)+a},easeInCirc:function(e,f,a,h,g){return -h*(Math.sqrt(1-(f/=g)*f)-1)+a},easeOutCirc:function(e,f,a,h,g){return h*Math.sqrt(1-(f=f/g-1)*f)+a},easeInOutCirc:function(e,f,a,h,g){if((f/=g/2)<1){return -h/2*(Math.sqrt(1-f*f)-1)+a}return h/2*(Math.sqrt(1-(f-=2)*f)+1)+a},easeInElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return -(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e},easeOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return g*Math.pow(2,-10*h)*Math.sin((h*k-i)*(2*Math.PI)/j)+l+e},easeInOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k/2)==2){return e+l}if(!j){j=k*(0.3*1.5)}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}if(h<1){return -0.5*(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e}return g*Math.pow(2,-10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j)*0.5+l+e},easeInBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*(f/=h)*f*((g+1)*f-g)+a},easeOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*((f=f/h-1)*f*((g+1)*f+g)+1)+a},easeInOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}if((f/=h/2)<1){return i/2*(f*f*(((g*=(1.525))+1)*f-g))+a}return i/2*((f-=2)*f*(((g*=(1.525))+1)*f+g)+2)+a},easeInBounce:function(e,f,a,h,g){return h-jQuery.easing.easeOutBounce(e,g-f,0,h,g)+a},easeOutBounce:function(e,f,a,h,g){if((f/=g)<(1/2.75)){return h*(7.5625*f*f)+a}else{if(f<(2/2.75)){return h*(7.5625*(f-=(1.5/2.75))*f+0.75)+a}else{if(f<(2.5/2.75)){return h*(7.5625*(f-=(2.25/2.75))*f+0.9375)+a}else{return h*(7.5625*(f-=(2.625/2.75))*f+0.984375)+a}}}},easeInOutBounce:function(e,f,a,h,g){if(f<g/2){return jQuery.easing.easeInBounce(e,f*2,0,h,g)*0.5+a}return jQuery.easing.easeOutBounce(e,f*2-g,0,h,g)*0.5+h*0.5+a}});

// Tab
var tabHandler = function(config_obj) {
	// Obj must have a holder and could have timing.
	var duration = 200;
	if (config_obj.duration) {
		duration = config_obj.duration;
	}
	var holder = $('[data-tab-holder = ' + config_obj.holder + ']');
	$('[data-tab-trigger]', holder).click(function(e) {
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

// Collapse
var collapseHandler = function(config_obj) {
	// Obj must have a holder and could have timing.
	var effect = false;
	if (config_obj.effect) {
		effect = config_obj.effect;
	}
	var holder = $('[data-collapse-holder = ' + config_obj.holder + ']');
	$('[data-collapse-trigger]', holder).click(function(e) {
		var self = $(this);
		e.preventDefault();
		var role = self.attr('data-collapse-trigger') || undefined,
		role_obj = $('[data-collapse-role = ' + role + ']');
		if (config_obj.effect && config_obj.duration) {
			role_obj.slideToggle(config_obj.duration);
		}
		else {
			role_obj.toggleClass('active');
		}
	});
}

// Alert
var alertHandler = function() {
	$('.alert').click(function() {
		var self = $(this);
		if (!self.hasClass('no-hide')) {
			self.fadeOut(200);
		}
	});
}

// Width Animation
var widthAnimator = function(selector) {
	var elem = $(selector);
	elem.animate({
		width : elem.attr('data-quota-used') + '%'
	}, 1500, 'easeOutCubic');
}

// Show signup section on existence of ?#signup
var hashHandler = function(hash, fn) {
	if (window.location.hash && window.location.hash == hash) {
		fn();
	}
}

// Init
$(document).ready(function() {
	// TABS
	tabHandler({
		holder: 'login-tab',
		duration: 200
	});

	// ALERTS
	alertHandler();
	// CAROUSEL

	// Footer Carousel
	$('.carousel').carousel();

	// QUOTA
	widthAnimator('.quota-progress-bar .bar');

	// POLICY

	// Disable submit if checkbox not clicked
	$('#policy').on('click', function() {
		if ($(this).is(':checked')) {
			$('.submit-register > input').prop('disabled', false);
		}
		else {
			$('.submit-register > input').prop('disabled', true);
		}
	});
	// Toggle Polivcy text on click of trigger
	$('#policy-trigger').click(function(e) {
		$('#policy-content').fadeToggle(200);
	});
	// Close Policy text on click od close btn
	$('#policy-content .close').click(function() {
		$('#policy-content').fadeOut(200);
	});
	$('[data-toggle="tooltip"]').tooltip();
	// Signup activation on hash existence
	hashHandler('#signup', function() {
		$('[data-tab-trigger="#register"]').click();
	});
	// JWPLAYER KEY
	jwplayer.key="/R3wdRK19fehG5OH7lyO2CXg3MoMpyCE/eLaqw==";
	// JWPLAYER FUNCTIONALITY
	$(function () {
		if($("div.player").length) {
			var playerInstance = jwplayer("player");
			playerInstance.setup({
				file: $(".player").attr("data-link"),
				width: "100%",
				aspectratio: "16:9"
			});
		}
	});
});