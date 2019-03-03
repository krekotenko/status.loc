<?php
class ControllerModuleRandom extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/random');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/module');
		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			

			$this->model_setting_setting->editSetting('random', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}		
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/random', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/random', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['random_status'])) {
			$data['random_status'] = $this->request->post['random_status'];
		} else {
			$data['random_status'] = $this->config->get('random_status');
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif($this->config->get('random_name')) {
			$data['name'] = $this->config->get('random_name');
		} else {
			$data['name'] = 'Похожие товары';
		}
		
		if (isset($this->request->post['random_limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif ($this->config->get('random_limit')) {
			$data['limit'] = $this->config->get('random_limit');
		} else {
			$data['limit'] = 5;
		}		
		
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/random.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['random_name']) < 3) || (utf8_strlen($this->request->post['random_name']) > 64)) {
			$this->error['name'] = "Введите заголовок от 3 до 64 символов";
		}

		if (!$this->request->post['random_limit']) {
			$this->error['limit'] = "Введите количество случайный товар в блоке";
		}		
		
		return !$this->error;
	}
}