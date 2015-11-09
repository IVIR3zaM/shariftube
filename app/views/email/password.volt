
        	<div style="text-align:right;margin-bottom:20px;">
        		<h4>{{ user.name|e }} گرامی </h4>
        	</div>
        	<div style="margin-bottom:20px;">
        		<p>
				    رمز عبور شما با موفقیت تغییر کرد. رمز عبور جدید شما:
				    <strong>{{ password }}</strong><br />
				    لطفا بعد از ورود به سایت حتما رمز عبور خود را تغییر دهید.<br />
				    از لینک زیر می توانید وارد سایت شود:
				</p>
        	</div>
        	<div>
        		<p style="direction: ltr;">
				    <a style="color:#0D3635" href="{{ link|e }}">{{ link|e }}</a>
				</p>
        	</div>
            