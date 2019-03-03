<?php
exit;

if (is_file('config.php')) {
	require_once('config.php');
}

// VirtualQMOD
require_once('./vqmod/vqmod.php');
VQMod::bootup();

// VQMODDED Startup
require_once(VQMod::modCheck(DIR_SYSTEM . 'startup.php'));
?>
<html dir="ltr" lang="ru">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
</head>
<body>
<a href="cat.php/?b=1">Добавить города к категориям</a><br>
<a href="cat.php/?b=2">Удалить города к категориям</a><br>

<?php
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

if(isset($_GET['b']) && $_GET['b']==1){
	$query = $db->query("SELECT * FROM `" . DB_PREFIX . "category` WHERE parent_id = '0'");
	$ww = $query->rows;
	
	foreach($ww as $w){
		$query = $db->query("SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE query = 'category_id=".$w['category_id']."' LIMIT 1");
		$zz = $query->row;
		
		if(count($zz)>0){
			
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
			
			foreach($seo as $s=>$d){
				$query = $db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, 'category_id=".$w['category_id']."', '".$zz['keyword']."_".$s."')");
			}

			echo "done!";
		}
	}
}

if(isset($_GET['b']) && $_GET['b']==2){
	$query = $db->query("SELECT * FROM `" . DB_PREFIX . "category` WHERE parent_id = '0'");
	$ww = $query->rows;
	
	//echo "<pre>";
	
	foreach($ww as $w){
		$query = $db->query("SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE query = 'category_id=".$w['category_id']."' LIMIT 1");
		$zz = $query->row;
		
		$id = $zz['url_alias_id'];
		
		if(count($zz)>0){
			$query = $db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query = 'category_id=".$w['category_id']."' AND `url_alias_id` != $id");
		}
		echo "delete!";
	}		
}


?>
</body>
</html>