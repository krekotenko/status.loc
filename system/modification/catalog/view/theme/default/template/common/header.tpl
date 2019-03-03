<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-TWDXPJT');</script>
<!-- End Google Tag Manager -->
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($alter_lang as $lang=>$href) { ?>
<link href="<?php echo $href; ?>" hreflang="<?php echo $lang; ?>" rel="alternate" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
  <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TWDXPJT"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
	 <div class="pull-left"></div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li>Мы принимаем к оплате: <img style="margin-left:10px;"src="/image/privat-24-visa-mc.png" alt="" /></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>

          </ul>
        </li>

        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>

      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="/"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5" style="font-size: 18px;font-weight: 700;padding:0;padding-top: 10px;color: #000;">
        <div class="row">
        	<div class="col-lg-6 col-md-6 text-center" style="padding:0;">
				<a href="tel:0991740373" style="color:#000;"><i class="fa fa-phone"></i> 099-174-03-73</a>
				<br>
				<a href="tel:0966855093" style="color:#000;"><i class="fa fa-phone"></i> 096-685-50-93</a>
				<br>
				<a href="tel:0631881129" style="color:#000;"><i class="fa fa-phone"></i> 063-188-11-29</a>
			</div>
        	<div class="col-lg-6 col-md-6 text-center" style="font-size: 16px;font-weight: 700;padding:0;color: #000;">
 		     	<p style="margin: 0;">Пн - Пт: <b>09:00-21:00</b></p>
 		     	<p style="margin: 0;">Сб - Вс: <b>10:00-18:00</b></p>
 		     	<p style="margin: 0;">Перерыв: <b>13:00-14:00</b></p>
			</div>
        </div>
      </div>
        <div class="col-sm-3">
            <?php echo $cart; ?>
        </div>
        <div class="col-sm-8">
            <?php echo $search; ?>
        </div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="menucontainer">
	<div class="container">
	  <nav id="menu" class="navbar">
	    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	    </div>
	    <div class="collapse navbar-collapse navbar-ex1-collapse">
	      <ul class="nav navbar-nav">

<li class="dropdown1"><a href="/" class="dropdown-toggle1" data-toggle="dropdown1">Главная</a></li>
			<li class="dropdown1"><a href="/index.php?route=information/contact" class="dropdown-toggle1" data-toggle="dropdown1">Запрос запчастей</a></li>
			<li class="dropdown1"><a href="/dlya-masterov" class="dropdown-toggle1" data-toggle="dropdown1">Для Мастеров</a></li>
			<li class="dropdown1"><a href="/delivery" class="dropdown-toggle1" data-toggle="dropdown1">Доставка и Оплата</a></li>
			<li class="dropdown1"><a href="/index.php?route=information/posts" class="dropdown-toggle1" data-toggle="dropdown1">Статьи</a></li>
			<li class="dropdown1"><a target="_blanc" href="http://servicekrivoyrog.com.ua/" class="dropdown-toggle1" data-toggle="dropdown1" rel="nofollow">Ремонт бытовой техники</a></li>


	      </ul>
	    </div>
	  </nav>
	</div>
</div>
<?php } ?>