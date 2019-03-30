<div class="h3"><?php echo $heading_title; ?></div>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <div class="product-cut__status">
          <div class="status_icon" style="fill: <?php if ($product['stock_status_id'] == 7) { ?>
                #4ba12a
            <?php } else if ($product['stock_status_id'] == 6 || $product['stock_status_id'] == 9) { ?>
                  #f16238
            <?php } else if ($product['stock_status_id'] == 8) { ?>
                  #61366b
            <?php }  else { ?>
                  #FF0000
            <?php } ?>">
            <?php if ($product['stock_status_id'] == 7) { ?>
                <svg id="svg-icon__status_available" viewBox="497.9 75.5 753.4 756" width="100%" height="100%"><path d="M845.1 630.5l-194-194 56.6-56.6 138.5 138.6 349.7-335.7 55.4 57.7z"></path><path d="M1174.5 491.3c-18.9 147.4-147.4 264.601-298.599 264.601C709.6 755.9 573.5 619.8 573.5 453.5s136.1-302.4 302.4-302.4c52.9 0 102 15.1 147.4 37.8l56.7-56.7c-60.5-34-128.5-56.7-204.099-56.7-207.9 0-378 170.1-378 378s170.1 378 378 378c196.5 0 355.3-147.4 374.199-340.2h-75.6z"></path></svg>
            <?php } else if ($product['stock_status_id'] == 6 || $product['stock_status_id'] == 9) { ?>
                <svg id="svg-icon__hourglass" viewBox="0 0 173.7 308.55" width="100%" height="100%">

                    <g id="layer1" inkscape:label="Layer 1" inkscape:groupmode="layer" transform="translate(-308.66 -170.24)">
                        <g id="g3834">
                            <g id="g3800" transform="translate(308.65 63.64)">
                                <path id="path2996" sodipodi:rx="90.714287" sodipodi:ry="28.571428" style="stroke:#f16238;stroke-width:11.059;fill:none" sodipodi:type="arc" d="m300 198.79a90.714 28.571 0 1 1 -181.43 0 90.714 28.571 0 1 1 181.43 0z" transform="matrix(.90426 0 0 .90426 -102.2 -42.316)" sodipodi:cy="198.79076" sodipodi:cx="209.28572"></path>
                                <g id="g3770" transform="translate(-.83653 -3.4724)">
                                    <path id="path3766" d="m5.8571 140.93v50.714c0 26.364 61.429 37.705 61.429 61.429v11.429" sodipodi:nodetypes="czzc" style="stroke:#f16238;stroke-width:10;fill:none" inkscape:connector-curvature="0"></path>
                                    <path id="path3768" sodipodi:nodetypes="czzc" style="stroke:#f16238;stroke-width:10;fill:none" inkscape:connector-curvature="0" d="m5.8571 388.01v-50.714c0-26.364 61.429-37.705 61.429-61.429v-11.429"></path>
                                </g>
                                <g id="g3774" transform="matrix(-1 0 0 1 174.94 -3.4724)">
                                    <path id="path3776" sodipodi:nodetypes="czzc" style="stroke:#f16238;stroke-width:10;fill:none" inkscape:connector-curvature="0" d="m5.8571 140.93v50.714c0 26.364 61.429 37.705 61.429 61.429v11.429"></path>
                                    <path id="path3778" d="m5.8571 388.01v-50.714c0-26.364 61.429-37.705 61.429-61.429v-11.429" sodipodi:nodetypes="czzc" style="stroke:#f16238;stroke-width:10;fill:none" inkscape:connector-curvature="0"></path>
                                </g>
                                <path id="path3798" sodipodi:nodetypes="czc" style="stroke:#f16238;stroke-width:10;fill:none" inkscape:connector-curvature="0" d="m5.0287 384.15s-3.4827 26.011 81.317 26.011 82.708-26.011 82.708-26.011"></path>
                            </g>
                            <path id="path3810" d="m328.72 250.15c-0.0717 0.1404 32.963 18.738 67.965 18.208 35.002-0.53033 66.465-19.269 66.465-19.269 0.70063 0-17.933 19.436-54.676 43.767-13.466 21.621-11.112 45.199-12.496 45.328-1.3838 0.12912 1.3821-25.682-13.203-46.846-36.575-24.856-53.983-41.329-54.055-41.189z" sodipodi:nodetypes="zzsczcz" inkscape:connector-curvature="0"></path>
                            <path id="path3832" sodipodi:nodetypes="czcszsc" inkscape:connector-curvature="0" d="m328.72 445.12c2.7568 1.9809 32.963 9.8995 67.965 10.43 35.002 0.53033 64.347-6.364 66.465-9.3692 2.1181-3.0052-27.422-24.553-44.565-29.171-13.405-3.6112-21.619-19.903-24.021-19.903-2.4021 0-13.408 16.236-26.496 19.421-15.753 3.8338-42.105 26.612-39.348 28.593z"></path>
                        </g>
                    </g>
                    <metadata>

                    </metadata>
                </svg>
            <?php } else if ($product['stock_status_id'] == 8) { ?>
                <svg id="svg-icon__status_order" viewBox="0 0 16 16" width="100%" height="100%"><path d="M13.6 2.4C12.2.9 10.2 0 8 0 3.6 0 0 3.6 0 8s3.6 8 8 8c3.7 0 6.8-2.6 7.7-6h-2.1c-.8 2.3-3 4-5.6 4-3.3 0-6-2.7-6-6s2.7-6 6-6c1.7 0 3.1.7 4.2 1.8L9 7h7V0l-2.4 2.4z"></path></svg>
            <?php }  else { ?>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 174.239 174.239" width="100%" height="100%"><path d="M87.12 0C39.082 0 0 39.082 0 87.12s39.082 87.12 87.12 87.12 87.12-39.082 87.12-87.12S135.157 0 87.12 0zm0 159.305c-39.802 0-72.185-32.383-72.185-72.185S47.318 14.935 87.12 14.935s72.185 32.383 72.185 72.185-32.384 72.185-72.185 72.185z"/><path d="M120.83 53.414c-2.917-2.917-7.647-2.917-10.559 0L87.12 76.568 63.969 53.414c-2.917-2.917-7.642-2.917-10.559 0s-2.917 7.642 0 10.559l23.151 23.153-23.152 23.154a7.464 7.464 0 0 0 0 10.559 7.445 7.445 0 0 0 5.28 2.188 7.437 7.437 0 0 0 5.28-2.188L87.12 97.686l23.151 23.153a7.445 7.445 0 0 0 5.28 2.188 7.442 7.442 0 0 0 5.28-2.188 7.464 7.464 0 0 0 0-10.559L97.679 87.127l23.151-23.153a7.465 7.465 0 0 0 0-10.56z"/></svg>
            <?php } ?>
          </div>
          <div class="status_text">
            <p><?php echo $product['stock']; ?></p>
          </div>
        </div>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
