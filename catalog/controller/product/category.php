<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {

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



			if ($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/rebra-barabana"){
				$title = "Активаторы (ребра барабана) для стиральной машины";
			}elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/antivibracionnye-podstavki"){
				$title = "Антивибрационные подставки для стиральной машины";
			}elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/zapchasti-dlja-stiralnyh-mashin"){
				$title = "Антивибрационные подставки для стиральной машины";
			}
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/blok-podshipnikov") {
				$title = "Блоки подшипников (суппорты) для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/zamki") {
				$title = "Замки для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/klapany-vody") {
				$title = "Клапаны воды для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/kondensatory") {
				$title = "Конденсаторы для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/krestoviny") {
				$title = "Крестовины для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/reziny-dverki") {
				$title = "Манжеты люка для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/motory") {
				$title = "Двигатели для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/nasosy") {
				$title = "Насосы для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/opory-dlya-barabana") {
				$title = "Опоры барабана для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/paneli-upravlenija") {
				$title = "Панели управления для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/patrubki") {
				$title = "Патрубки для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/petli-ljuka") {
				$title = "Петли люка для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/podshipniki") {
				$title = "Подшипники для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/pruzhiny-baka") {
				$title = "Пружины бака для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/remni") {
				$title = "Ремни для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/ruchki-dlja-stiralnyh-mashin") {
				$title = "Ручки для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/salniki") {
				$title = "Сальники для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/setevye-filtry") {
				$title = "Сетевые фильтры для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/smazki") {
				$title = "Смазки для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/taho-datchiki") {
				$title = "Таходатчики для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/zapchasti-dlja-stiralnyh-mashin/tjeny-dlja-stiralnyh-mashin") {
				$title = "ТЭНы для стиральной машины"; }
			elseif($this->request->get['_route_']=="filtra") {
				$title = "Фильтры для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/shlangi-zalivnye") {
				$title = "Шланги заливные для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/shhjotki") {
				$title = "Щётки для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/jelektronnye-moduli-dlja-stiralnyh-mashin") {
				$title = "Электронные модули для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/aksessuary") {
				$title = "Аксессуары для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-stiralnyh-mashin/amortizatory") {
				$title = "Амортизаторы для стиральной машины"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/vysokovoltnye-diody") {
				$title = "Высоковольтные диоды для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/kuplery") {
				$title = "Куплеры для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/magnetron") {
				$title = "Магнетроны для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/motor") {
				$title = "Моторы для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/predohraniteli") {
				$title = "Предохранители для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/rollery") {
				$title = "Роллеры для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/sljuda") {
				$title = "Слюда для микроволновой печи"; }
			elseif($this->request->get['_route_']=="zapchasti-dlja-mikrovolnovok/tarelki") {
				$title = "Тарелки для микроволновой печи"; }
			elseif($this->request->get['_route_']=="anody") {
				$title = "Аноды для бойлера"; }
			elseif($this->request->get['_route_']=="klapana") {
				$title = "Клапаны для бойлера"; }
			elseif($this->request->get['_route_']=="prokladki") {
				$title = "Прокладки для бойлера"; }
			elseif($this->request->get['_route_']=="termometry") {
				$title = "Термометры для бойлера"; }
			elseif($this->request->get['_route_']=="teny") {
				$title = "ТЭНы для бойлера"; }
			elseif($this->request->get['_route_']=="flancy"){
				$title = "Фланцы для бойлера"; 
			}else{
				$title = $category_info['name'];
			}			
			
			$requ = $this->request->get['_route_'];
			$exp = explode("_", $requ);
			
			if(isset($exp[1])){
				$qq = explode("/",$exp[1]);
				if(count($qq)>1){
					$exp[1] = stristr($exp[1], '/', true);
				}
				$lng = $seo[$exp[1]];
				if($this->request->get['path']!="25"){
					if(stripos($requ, "zapchasti-dlja-stiralnyh-mashin")!==false){
						$title = $title." для стиральной машины";
					}
				}
				if($this->request->get['path']!="201"){
					if(stripos($requ, "zapchasti-k-mjasorubkam-kombainam")!==false){
						$title = $title." для мусорубки/комбайна";
					}
				}
				if($this->request->get['path']!="17"){
					if(stripos($requ, "zapchasti-dlja-bojlerov")!==false){
						$title = $title." для бойлера";
					}
				}
				if($this->request->get['path']!="57"){
					if(stripos($requ, "zapchasti-dlja-mikrovolnovok")!==false){
						$title = $title." для микроволновки";
					}
				}
				if($this->request->get['path']!="18"){
					if(stripos($requ, "zapchasti-dlja-kondicionerov")!==false){
						$title = $title." для кондиционера";
					}
				}
				if($this->request->get['path']!="20"){
					if(stripos($requ, "zapchasti-dlja-holodilnikov")!==false){
						$title = $title." для холодильника";
					}
				}
				if($this->request->get['path']!="202"){
					if(stripos($requ, "zapchasti-jelektroplity-i-duhovki")!==false){
						$title = $title." для электроплиты/духовки";
					}
				}
				if($this->request->get['path']!="204"){
					if(stripos($requ, "zapchasti-dlja-posudomoechnyh-mashin")!==false){
						$title = $title." для посудомоечной машины";
					}
				}
				$this->document->setTitle($title." ".$lng." купить с доставкой | Интернет-магазин Статус Сервис");
				$this->document->setDescription("Интернет-магазин Статус предлагает ".$category_info['name']." ".$lng." на любой вкус. Купить запчасти для бытовой техники еще не было так легко. $ Низкие цены ✈Доставка ☑Каталог, фото, отзывы. ☎ 099-174-03-73.");
			}else{
				$this->document->setTitle($category_info['meta_title']);
				$this->document->setDescription($category_info['meta_description']);
			}

			
			if(isset($lng)){
				$chk = stripos($requ, "zapchasti-dlja-stiralnyh-mashin");
				if($chk!==false){
					//$title = $title." для стиральной машины";
				}
				$title = $title." ".$lng;
				
				

				
				
			}
			
			
			//$this->document->addLink($this->url->link('product/category', "path=".$this->request->get['path']), 'canonical');
			$this->document->setKeywords($category_info['meta_keyword']);


			$data['heading_title'] = $title;

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$data['thumb'] = '';
			}
			if(isset($lng)){
				$data['description'] = '';
			}else{
				$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			}
			
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				$data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}
			if(isset($lng)){
				$results = $this->model_catalog_category->getCategories(0);
				$rand = array();

				foreach ($results as $category) {
					$children = $this->model_catalog_category->getCategories($category['category_id']);
					if (count($children)>0) {
						foreach($children as $child) {
							
							$hrf = $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']);
							
							$chk = stripos($hrf, "zapchasti-dlja-stiralnyh-mashin");
							if($chk!==false){
								$child['name'] = $child['name']." для стиральной машины";
							}
							
							$rand[] = array(
								'name' => $child['name'],
								'href' => $hrf
							);
						}
					}

					$rand[] = array(
						'name'        => $category['name'],
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
					);
				}
				$i=0;
				while($i<5){
					$rand_keys = array_rand($seo, 2);
					$name_rand_seo = $seo[$rand_keys[0]];
					$rnd = rand(0,count($rand));
					$rnd_rand = $rand[$rnd];
						$urd = explode("/",$rnd_rand['href']);
						$buff = $urd[3];
						$urd[3]=$buff."_".$rand_keys[0];
						
					$rnd_rand['href'] = implode("/",$urd);
					$rnd_rand['name'] = $rnd_rand['name']." ".$name_rand_seo;
					
					$data['seo_rand'][] = $rnd_rand;
					$i++;
				}
			}
			
			
			
			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


                if ($result['quantity'] <= 0) {
                   $stock = $result['stock_status'];
                   $stock_status_id = $result['stock_status_id'];
                } elseif ($this->config->get('config_stock_display')) {
                    $stock = $result['quantity'];
                    $stock_status_id = 7;
                } else {
                    $stock_status_id = 7;
                    $stock = $this->language->get('text_instock');
                }

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url),
					'stock'      => $stock,
					'stock_status_id'      => $stock_status_id
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
}