<form id="search-form" action="<?php echo $this->url->get(array('for' => 'search')); ?>" method="get">
    <label for="q">عبارت</label>
    <input id="q" type="text" size="50" name="q" value="<?php echo $this->escaper->escapeHtml($q); ?>">
    <input type="submit" value="جست و جو"><br>
    <select name="dur">
        <option value="All"<?php if ($dur == 'All' || !$dur) { ?> selected="selected"<?php } ?>>هر دوره زمانی</option>
        <option value="s"<?php if ($dur == 's') { ?> selected="selected"<?php } ?>>تا ۴ دقیقه</option>
        <option value="m"<?php if ($dur == 'm') { ?> selected="selected"<?php } ?>>۴ تا ۲۰ دقیقه</option>
        <option value="l"<?php if ($dur == 'l') { ?> selected="selected"<?php } ?>>بیشتر از ۲۰ دقیقه</option>
    </select>
    <select name="hq">
        <option value="All"<?php if ($hq == 'All' || !$dur) { ?> selected="selected"<?php } ?>>هر کیفیتی</option>
        <option value="h"<?php if ($hq == 'h') { ?> selected="selected"<?php } ?>>کیفیتی بالا</option>
    </select>
    <select name="qdr">
        <option value="All"<?php if ($qdr == 'All' || !$dur) { ?> selected="selected"<?php } ?>>هر زمانی</option>
        <option value="h"<?php if ($qdr == 'h') { ?> selected="selected"<?php } ?>>تا یک ساعت پیش</option>
        <option value="d"<?php if ($qdr == 'd') { ?> selected="selected"<?php } ?>>تا یک روز پیش</option>
        <option value="w"<?php if ($qdr == 'w') { ?> selected="selected"<?php } ?>>تا یک هفته پیش</option>
        <option value="m"<?php if ($qdr == 'm') { ?> selected="selected"<?php } ?>>تا یک ماه پیش</option>
        <option value="y"<?php if ($qdr == 'y') { ?> selected="selected"<?php } ?>>تا یک سال پیش</option>
    </select>
    <select name="website">
        <option value="All"<?php if ($qdr == 'All' || !$dur) { ?> selected="selected"<?php } ?>>هر سایتی</option>
        <?php foreach ($websites as $item) { ?>
        <option value="<?php echo $this->escaper->escapeHtml($item->name); ?>"<?php if ($website == $item->name) { ?> selected="selected"<?php } ?>><?php echo $this->escaper->escapeHtml($item->name); ?></option>
        <?php } ?>
    </select>
</form>
<?php if ($captcha) { ?>
    <form method="post" action="<?php echo $this->escaper->escapeHtml($this->url->get(array('for' => 'search', 'params' => implode('/', array($start, $dur, $hq, $qdr, $website, $q))))); ?>">
        <?php foreach ($hidden_items as $name => $value) { ?>
        <input type="hidden" name="params[<?php echo $this->escaper->escapeHtml($name); ?>]" value="<?php echo $this->escaper->escapeHtml($value); ?>">
        <?php } ?>
        <p>
            لطفا برای ادامه کار کد امنیتی زیر را وارد نمایید.<br>
            <img src="<?php echo $captcha_image; ?>"><br>
            <input type="text" name="code" placeholder="کد تصویر بالا"><br>
            <input type="submit" name="captcha" value="ادامه">
        </p>


    </form>
<?php } ?>
<?php if ($this->length($records)) { ?>
    <ul class="results">
    <?php foreach ($records as $record) { ?>
        <li>
            <?php if ($record->image) { ?>
            <img src="<?php echo $record->image; ?>">
            <?php } ?>
            <h3><?php echo $record->title; ?></h3>
            <div><?php echo $record->description; ?></div>
            <?php if ($record->duration) { ?>
            <div class="inline"><?php echo $record->duration; ?></div>
            <?php } ?>
            <div class="inline"><?php echo $record->website; ?></div>
            <div class="inline"><?php echo $date->date('j F Y', $record->date); ?></div>
            <a class="inline" href="<?php echo $this->escaper->escapeHtml($this->url->get(array('for' => 'link', 'link' => $record->link))); ?>">دریافت</a>
        </li>
    <?php } ?>
    </ul>
<?php } ?>
<?php if ($have_next) { ?>
    <a href="<?php echo $this->escaper->escapeHtml($this->url->get(array('for' => 'search', 'params' => implode('/', array($last_item, $dur, $hq, $qdr, $website, $q))))); ?>">صفحه بعدی</a>
<?php } ?>