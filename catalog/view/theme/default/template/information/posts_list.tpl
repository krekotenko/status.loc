<?php echo $header; ?>
<div class="container">
  
  <div class="row">
	  <div class="col-xs-12">
				<div class="content-in">
					<div class="row">
					
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<?php echo $content_top; ?>
		 <h2 class="page-title"><?php echo $heading_title; ?></h2>
			<div class="posts-list">
			<?php foreach ($all_posts as $posts) { ?>
			<div class="posts-item">
			<div class="row">
			 <?php if ($posts['image']) { ?>
				<div class="col-md-2 col-sm-3 text-center"><a href="<?php echo $posts['view']; ?>"><img src="<?php echo $posts['image']; ?>" /></a></div>
				<div class="col-md-10 col-sm-9">
					<div class="posts-title"><a href="<?php echo $posts['view']; ?>"><?php echo $posts['title']; ?></a></div>
					<div class="posts-date"><?php echo $posts['date_added']; ?></div>
					<div class="posts-descr"><?php echo $posts['description']; ?></div>
					<a href="<?php echo $posts['view']; ?>" class="read-more-posts">&#8674; Читать далее</a>
				</div>
			 <? } else { ?>
				<div class="col-xs-12" style="margin-bottom:20px;">
				    <div class="posts-date" style="float:left;margin-right:15px;"><span style="display:block;line-height: 5px;" class="btn btn-success btn-xs"><?php echo $posts['date_added']; ?></span></div>
					<div class="posts-title" style="font-size:20px;font-weight:700;"><a style="color:#555;" href="<?php echo $posts['view']; ?>"><?php echo $posts['title']; ?></a></div>
					
					<div class="posts-descr" style="clear:both;margin-top:5px;"><?php echo $posts['description']; ?> <a href="<?php echo $posts['view']; ?>">Читать далее</a></div>
					
				</div>
			  <? } ?>
			</div>
			</div>
			<?php } ?>
			</div>
	  <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	</div></div></div>
</div>
<?php echo $footer; ?> 