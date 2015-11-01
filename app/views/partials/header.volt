<div class="panel-right">
    <img src="http://www.gravatar.com/avatar/{{ auth.getIdentity().email|md5 }}.jpg?s=50" alt="{{ auth.getIdentity().email|e }}"/>
    {{ auth.getIdentity().name|e }}
    <div class="progress-bar">
        <div class="bar" style="width: {{ ((auth.getIdentity().used*100)/auth.getIdentity().quota)|intval }}%;"></div>
        <div class="info">
            {{ number_format(auth.getIdentity().used/1024/1024/1024, 2) }}GB/{{ number_format(auth.getIdentity().quota/1024/1024/1024, 2) }}GB
        </div>
    </div>
    <a href="{{ url.get(['for':'shop']) }}">خرید حجم</a>
    <a href="{{ url.get(['for':'logout']) }}">خروج</a>
</div>
</div>