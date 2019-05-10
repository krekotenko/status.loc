<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
       <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
       <li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
       <?php }
       else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
       <?php } ?>
   </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
             <li><a href="#tab-models" data-toggle="tab">Модели (<?php echo count($tags); ?>)</a></li>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <div class="tab-pane" id="tab-models">
                <div class="brend_block">
                    <div class="modelSearch">
                        Введите модель для быстрого поиска: <input type="text" class="live-search-box" placeholder="search here" />
                    </div>
                    <div class="modelList live-search-list" id="modelList9">
                        <?php foreach ($tags as  $key => $tag) { ?>
                            <div <?php if ($key > 9) {echo ' style="display: none;"';}?>> <?php echo $tag?></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php if ($site_key) { ?>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                  </div>
                <?php } ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
          </ul>
          <div class="product-cut__status">
            <div class="status_icon" style="fill: <?php if ($stock_status_id == 7) { ?>
                              #4ba12a
                      <?php } else if ($stock_status_id == 6 || $stock_status_id == 9) { ?>
                              #f16238
                      <?php } else if ($stock_status_id == 8) { ?>
                              #61366b
                      <?php }  else { ?>
                              #FF0000
                      <?php } ?>">
              <?php if ($stock_status_id == 7) { ?>
              <svg id="svg-icon__status_available" viewBox="497.9 75.5 753.4 756" width="100%" height="100%"><path d="M845.1 630.5l-194-194 56.6-56.6 138.5 138.6 349.7-335.7 55.4 57.7z"></path><path d="M1174.5 491.3c-18.9 147.4-147.4 264.601-298.599 264.601C709.6 755.9 573.5 619.8 573.5 453.5s136.1-302.4 302.4-302.4c52.9 0 102 15.1 147.4 37.8l56.7-56.7c-60.5-34-128.5-56.7-204.099-56.7-207.9 0-378 170.1-378 378s170.1 378 378 378c196.5 0 355.3-147.4 374.199-340.2h-75.6z"></path></svg>
              <?php } else if ($stock_status_id == 6 || $stock_status_id == 9) { ?>
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
              <?php } else if ($stock_status_id == 8) { ?>
              <svg id="svg-icon__status_order" viewBox="0 0 16 16" width="100%" height="100%"><path d="M13.6 2.4C12.2.9 10.2 0 8 0 3.6 0 0 3.6 0 8s3.6 8 8 8c3.7 0 6.8-2.6 7.7-6h-2.1c-.8 2.3-3 4-5.6 4-3.3 0-6-2.7-6-6s2.7-6 6-6c1.7 0 3.1.7 4.2 1.8L9 7h7V0l-2.4 2.4z"></path></svg>
              <?php }  else { ?>
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 174.239 174.239" width="100%" height="100%"><path d="M87.12 0C39.082 0 0 39.082 0 87.12s39.082 87.12 87.12 87.12 87.12-39.082 87.12-87.12S135.157 0 87.12 0zm0 159.305c-39.802 0-72.185-32.383-72.185-72.185S47.318 14.935 87.12 14.935s72.185 32.383 72.185 72.185-32.384 72.185-72.185 72.185z"/><path d="M120.83 53.414c-2.917-2.917-7.647-2.917-10.559 0L87.12 76.568 63.969 53.414c-2.917-2.917-7.642-2.917-10.559 0s-2.917 7.642 0 10.559l23.151 23.153-23.152 23.154a7.464 7.464 0 0 0 0 10.559 7.445 7.445 0 0 0 5.28 2.188 7.437 7.437 0 0 0 5.28-2.188L87.12 97.686l23.151 23.153a7.445 7.445 0 0 0 5.28 2.188 7.442 7.442 0 0 0 5.28-2.188 7.464 7.464 0 0 0 0-10.559L97.679 87.127l23.151-23.153a7.465 7.465 0 0 0 0-10.56z"/></svg>

              <?php } ?>
            </div>
            <div class="status_text">
              <p><?php echo $stock; ?></p>
            </div>
          </div>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <span class="price"><?php echo $price; ?></span>
            </li>
            <?php } else { ?>
            <li><span class="old-price"><?php echo $price; ?></span></li>
            <li>
              <span class="new-price"><?php echo $special; ?></span>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <div id="product">
            <?php if ($options) { ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
                <div class="delivery-block" id="deliveryBlock">
              <div class="inform-block">
                <div class="inform-title"><span class="product-icon delivery-icon"></span>Доставка</div>
                <div class="inform-subtitle">По Украине</div>
                <ul>
                  <li>− Доставка в течении 1-2 суток </li>
                  <li>− Самовывоз из пункта службы доставки</li>
                  <li>− Курьером по адресу</li>
                </ul>
              </div>
              <div class="inform-block">
                <div class="inform-title"><span class="product-icon pay-icon"></span>Оплата</div>
                <ul>
                  <li>− Наличными, Безналичными</li>
                </ul>
              </div>
              <div class="inform-block">
                <div class="inform-title"><span class="product-icon warranty-icon"></span>Гарантия</div>
                <ul>
                  <li>− Обмену и возврату не подлежит</li>
                  <li>− Абсолютно новый товар</li>
                  <li>− Гарантия качества 100%</li>
                </ul>
              </div>
            </div>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3>Вместе с этим товаром покупают</h3>
      <div id="relatedproduct" class="custom-row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <div>
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
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
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <script type="text/javascript"><!--
          $('#relatedproduct').owlCarousel({
              items: 3,
              autoPlay: 3000,
              navigation: true,
              navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
              pagination: false,
              loop: true
          });
          --></script>
      <?php } ?>
      <?php if ($products_similar) { ?>
      <h3>В наличии похожие товары</h3>
      <div id="similarproduct" class="custom-row">
        <?php $i = 0; ?>
        <?php foreach ($products_similar as $product) { ?>
        <div>
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
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
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <script type="text/javascript"><!--
          $('#similarproduct').owlCarousel({
              items: 3,
              autoPlay: 3000,
              navigation: true,
              navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
              pagination: false,
              loop: true
          });
          --></script>
      <?php } ?>
      <?php if ($seo_rand) { ?>
      <h3>Доставка любых запчастей в Украине</h3>
      <div class="row">
          <?php foreach ($seo_rand as $key => $link) { ?>
            <?php if ($key == 0) { ?>
                <div class="col-md-6">
            <?php } ?>
            <?php if ($key % 5 == 0 && $key != 0 ) { ?>
                </div><div class="col-md-6">
            <?php } ?>
            <a style='display:block' href="<?php echo $link['href']; ?>"><?php echo $link['name']; ?></a>
             <?php if ($key == count($seo_rand) -1 ) { ?>
                  </div>
             <?php } ?>
          <?php } ?>
      </div>
      <?php } ?>
      <?php /*if ($tags) { */?><!--
      <p><?php /*echo $text_tags; */?>
        <?php /*for ($i = 0; $i < count($tags); $i++) { */?>
        <?php /*if ($i < (count($tags) - 1)) { */?>
        <a href="<?php /*echo $tags[$i]['href']; */?>"><?php /*echo $tags[$i]['tag']; */?></a>,
        <?php /*} else { */?>
        <a href="<?php /*echo $tags[$i]['href']; */?>"><?php /*echo $tags[$i]['tag']; */?></a>
        <?php /*} */?>
        <?php /*} */?>
      </p>
      --><?php /*} */?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});

    jQuery(document).ready(function($){

        $('.live-search-list div').each(function(){
            $(this).attr('data-search-term', $(this).text().toLowerCase());
        });
        $('.live-search-box').on('keyup', function(){
            var searchTerm = $(this).val().toLowerCase();
            var i = 0;
            $('.live-search-list div').each(function(){
                if (($(this).filter('[data-search-term *= ' + searchTerm + ']').length > 0 || searchTerm.length < 1) && i < 10) {
                    $(this).show();
                    i++;
                } else {
                    $(this).hide();
                }
            });
        });
    });
//--></script>
<?php echo $footer; ?>