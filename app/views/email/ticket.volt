<div style="text-align:right;margin-bottom:20px;">
    <h4>{{ user.name|e }} گرامی </h4>
</div>
<div style="margin-bottom:20px;">
    <p>
        تیکت جدید برای شما با عنوان <strong>"{{ ticket.title|e }}"</strong> ایجاد شد. <br>
        به زودی درخواست شما توسط یکی از اپراتورها پاسخ داده خواهد شد.<br>
        با تشکر از تماس شما
    </p>
</div>
<div>
    <p>
        <a style="color:#0D3635" href="https://shariftube.ir/unsubscribe/{{ hash|e }}">حذف ایمیل شما از خبرنامه</a>
    </p>
    <p style="direction: ltr;">
        <a style="color:#0D3635" href="{{ link|e }}">{{ link|e }}</a>
    </p>
</div>