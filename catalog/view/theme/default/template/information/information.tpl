<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
      <h1><?php echo $heading_title; ?></h1>
	  
	  <?php
	  
			$seo = array(
				'harkov' =>                'в Харькове',
				'odessa' =>                'в Одессе',
				'dnepr' =>                 'в Днепре',
				'zaporozhie' =>            'в Запорожье',
				'lvov' =>                  'во Львове',
				'krivoy-rog' =>            'в Кривом Роге',
				'nikolaev' =>              'в Николаеве',
				'mariupol' =>              'в Мариуполе',
				'vinnica' =>               'в Виннице',
				'herson' =>                'в Херсоне',
				'poltava' =>               'в Полтаве',
				'chernigov' =>             'в Чернигове',
				'cherkassy' =>             'в Черкассах',
				'hmelnickiy' =>            'в Хмельницком',
				'zhitomir' =>              'в Житомире',
				'chernovcy' =>             'в Черновцах',
				'sumy' =>                  'в Сумах',
				'rovno' =>                 'в Ровно',
				'kamenskoe' =>             'в Каменском',
				'ivano-frankovsk' =>       'в Ивано-Франковске',
				'kropivnickiy' =>          'в Кропивницком',
				'kremenchug' =>            'в Кременчуге',
				'ternopol' =>              'в Тернополе',
				'luck' =>                  'в Луцке',
				'belaya-cerkov' =>         'в Белой Церкви',
				'kramatorsk' =>            'в Краматорске',
				'melitopol' =>             'в Мелитополе',
				'uzhgorod' =>              'в Ужгороде',
				'nikopol' =>               'в Никополе',
				'berdyansk' =>             'в Бердянске',
				'pavlograd' =>             'в Павлограде',
				'brovary' =>               'в Броварах',
				'kamenec-podolskiy' =>     'в Каменец-Подольском',
				'aleksandriya' =>          'в Александрие',
				'berdichev' =>             'в Бердичеве',
				'borispol' =>              'в Борисполе',
				'verhnedneprovsk' =>       'в Верхнеднепровске',
				'izmail' =>                'в Измаиле',
				'kanev' =>                 'в Каневе'
			);
	  
	  
		if(isset($categories2)){
			foreach($categories2 as $cat){
				echo "<h2>".$cat['name']."</h2>";
				if(count($cat["children"])>0){
					foreach($cat["children"] as $child){
						echo "<h3>".$child['name']."</h3>";
						
						$urd = explode("/",$child['href']);
						$buff = $urd[3];
						foreach($seo as $s=>$k){
							$urd[3]=$buff."_".$s;
							$url = implode("/",$urd);
							
							echo "<a href='".$url."' class='citymap'>".$child['name']." ".$k."</a>";
						}
						
					}
				}
			}
		}
	  ?>
	  
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	<style>
	h2 {
		font-size: 18px;
		font-weight: 700;
	}
	h3 {
		font-size: 15px;
		margin-left: 25px;
	}
	.citymap{
		display:block;
		margin-left: 50px;
	}
	</style>	
</div>
<?php echo $footer; ?>