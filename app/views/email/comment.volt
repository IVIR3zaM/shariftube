<div style="text-align:right;margin-bottom:20px;">
    <h4>{{ name|e }} گرامی</h4>

    <p>لطفا دیدگاه خود نسبت به سرویس شریف تیوب را از طریق فرم زیر به اطلاع ما برسانید.</p>
</div>
<div style="margin-bottom:20px;">

    <form action="https://shariftube.ir/comment/" method="post">
        <input type="hidden" name="auth" value="{{ auth|e }}">

        <div style="margin: 10px auto">
            <label>دیدگاه شما</label>

            <div style="margin: 10px auto">
                <textarea name="comment" cols="50" rows="10"></textarea>
            </div>
        </div>
        <div style="margin: 10px auto">
            <input type="submit" value="ارسال">
        </div>
    </form>

    <p>
        اگر با ارسال دیدگاه مشکل دارید
        <a style="color:#0D3635; text-decoration: none;"
           href="https://shariftube.ir/comment/{{ vinix_auth|e }}">اینجا</a>
        کلیک کنید.
    </p>
</div>
<div>
    <p>
        <a style="color:#0D3635" href="https://shariftube.ir/unsubscribe/{{ hash|e }}">حذف ایمیل شما از خبرنامه</a>
    </p>

    <p style="direction: ltr;">
        <a style="color:#0D3635" href="https://shariftube.ir/">https://shariftube.ir/</a>
    </p>
</div>