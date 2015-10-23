<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>شریف تیوب - <?php echo $title; ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<?php echo $this->url->getBaseUri(); ?>css/style.css">
    </head>
    <body>
        <?php if (!$this->isIncluded($this->dispatcher->getActionName(), array('login', 'route404'))) { ?>
            <?php echo $this->partial('partials/header'); ?>
        <?php } ?>

		<?php echo $this->getContent(); ?>

        <?php if (!$this->isIncluded($this->dispatcher->getActionName(), array('login', 'route404'))) { ?>
            <?php echo $this->partial('partials/footer'); ?>
        <?php } ?>
        <script src="<?php echo $this->url->getBaseUri(); ?>js/jquery.min.js"></script>
        <script src="<?php echo $this->url->getBaseUri(); ?>js/leech.js"></script>
    </body>
</html>