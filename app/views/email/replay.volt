<div style="text-align:right;margin-bottom:20px;">
    <h4>{{ user.name }} گرامی </h4>
</div>
<div style="margin-bottom:20px;">
    <p>
        یک پاسخ جدید به تیکت شما با عنوان <strong>"{{ ticket.title|e }}"</strong> ارسال شد. <br>
        برای مشاهده متن پاسخ روی لینک زیر کلیک کنید.<br>
        با تشکر از تماس شما
    </p>
</div>
<div>
    <p style="direction: ltr;">
        <a style="color:#0D3635" href="{{ link }}">{{ link }}</a>
    </p>
</div>