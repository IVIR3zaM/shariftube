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

<?php if ($this->length($records)) { ?>
    <?php foreach ($records as $record) { ?>

    <?php } ?>
<?php } ?>