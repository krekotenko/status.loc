<?php  
class ControllerModuleRandom extends Controller {
	public function index() {

		$this->load->language('module/random_product'); //подключаем любой языковой файл
		$data['heading_title'] = $this->language->get('heading_title'); //объявляем переменную heading_title с данными из языкового файла

		$this->load->model('setting/setting');
		$settings = $this->model_setting_setting->getSetting('random');

		$this->load->model('catalog/product'); //подключаем любую модель из OpenCart
		$all = $this->model_catalog_product->getProducts(); //используем метод подключенной модели, например getProduct(42) – информация о продукте id  42

		$i=0;
		$products = array();
		while($i<$settings["random_limit"]){
			$rand_keys = array_rand($all, 2);
			$products[$i] = $all[$rand_keys[0]];
			$products[$i]['href'] = $this->url->link('product/product', 'product_id=' . $products[$i]['product_id']);
			$i++;
		}

		$data["random_products"] = $products;
		$data["random_name"] = $settings["random_name"];
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/random.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/random.tpl', $data);
		} else {
			return $this->load->view('default/template/module/random.tpl', $data);
		}		

	}
}?>