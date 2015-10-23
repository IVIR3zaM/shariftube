<div class="panel-right">
    <img src="http://www.gravatar.com/avatar/<?php echo md5($this->auth->getIdentity()->email); ?>.jpg?s=50" alt="<?php echo $this->escaper->escapeHtml($this->auth->getIdentity()->email); ?>"/>
    <?php echo $this->escaper->escapeHtml($this->auth->getIdentity()->name); ?>
    <div class="progress-bar">
        <div class="bar" style="width: <?php echo intval((($this->auth->getIdentity()->used * 100) / $this->auth->getIdentity()->quota)); ?>%;"></div>
        <div class="info">
            <?php echo number_format($this->auth->getIdentity()->used / 1024 / 1024, 2); ?>GB/<?php echo number_format($this->auth->getIdentity()->quota / 1024 / 1024, 2); ?>GB
        </div>
    </div>
    <a href="<?php echo $this->url->get(array('for' => 'shop')); ?>">خرید حجم</a>
    <a href="<?php echo $this->url->get(array('for' => 'logout')); ?>">خروج</a>
</div>
<div class="panel-left">
    <?php if ($this->auth->getIdentity()->referral_code) { ?>
        تعداد افراد معرفی شده: <?php echo number_format($referral_count, 0); ?><br />
        درآمد این ماه: <?php echo number_format($month_incomes, 0); ?> ریال<br />
        درآمد کل: <?php echo number_format($total_incomes, 0); ?> ریال
    <?php } ?>
</div>
<div class="clear"></div>
<ul class="links">
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'search') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'search')); ?>">جست و جوی ویدئو</a>
    </li>
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'index') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'home')); ?>">درخواست ویدئو</a>
    </li>
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'files') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'files')); ?>">لیست ویدئوها</a>
    </li>
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'shop') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'shop')); ?>">خرید</a>
    </li>
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'purchases') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'purchases')); ?>">لیست خریدهای گذشته</a>
    </li>
    <li>
        <a<?php if ($this->dispatcher->getActionName() == 'settings') { ?> class="active"<?php } ?> href="<?php echo $this->url->get(array('for' => 'settings')); ?>">تنظیمات</a>
    </li>
</ul>