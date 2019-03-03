<footer>
<div class="kac-sm-panel" itemscope itemtype="http://schema.org/LocalBusiness">
    <ul>
     <li class="kac-sm-block kac-sm-fb"><a href="https://www.facebook.com/%D0%A1%D1%82%D0%B0%D1%82%D1%83%D1%81-318947268627234/" itemprop="sameAs" target="_blank"><img src="catalog/view/theme/default/image/fb-icon.png" alt="Официальная страница на Facebook"><span class="kac-sm-with">Facebook</span></a></li>
	 <li class="kac-sm-block kac-sm-youtube"><a href="https://www.youtube.com/channel/UCQYxCBcPeaT0PhqyA2b7RVQ?view_as=subscriber" itemprop="sameAs" target="_blank"><img src="catalog/view/theme/default/image/youtube-icon.png" alt="Официальная страница на YouTube" /><span>YouTube</span></a></li>
	 <li class="kac-sm-block kac-sm-instagram"><a href="https://www.instagram.com/shop.statusservice.com.ua/" itemprop="sameAs" rel="publisher" target="_blank"><img src="catalog/view/theme/default/image/instagram-icon.png" alt="Официальная страница на Instagram" /><span>Instagram</span></a></li>
	</ul>
</div>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <div class="h5"><?php echo $text_information; ?></div>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <div class="h5"><?php echo $text_service; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <div class="h5"><?php echo $text_extra; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <div class="h5"><?php echo $text_account; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <div style="float:left;"><a href="/">Интернет магазин запчастей для бытовой техники в Украине</a></div>
  </div>
</footer>

<script type="text/javascript">
var source_link = '<span id="copyinfo" style="position: absolute; overflow: hidden; width: 1px; height: 1px; color: #333333; font-family: Arial, Helvetica, FreeSans, "Liberation Sans", "Nimbus Sans L", sans-serif; font-size: 14.0014px; line-height: 20.0019px;"><br />Подробнее:<a style="text-decoration: none; outline: none; color: #9d5faf;" href="' + location.href + '">' + location.href + '</a></span>';
jQuery(
    function($)
    {
        if (window.getSelection) $('body').bind(
            'copy',
            function()
            {
                var selection = window.getSelection();
                var range = selection.getRangeAt(0);

                var magic_div = $('<div>').css({ overflow : 'hidden', width: '1px', height : '1px', position : 'absolute', top: '-10000px', left : '-10000px' });
                magic_div.append(range.cloneContents(), source_link);
                $('body').append(magic_div);

                var cloned_range = range.cloneRange();
                selection.removeAllRanges();

                var new_range = document.createRange();
                new_range.selectNode(magic_div.get(0));
                selection.addRange(new_range);

                window.setTimeout(
                    function()
                    {
                        selection.removeAllRanges();
                        selection.addRange(cloned_range);
                        magic_div.remove();
                    }, 0
                );
            }
        );
    }
);
</script>
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = '1Ij6Y8wrar';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->
</body></html>
