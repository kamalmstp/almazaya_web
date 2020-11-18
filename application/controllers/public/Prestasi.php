<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Prestasi extends Public_Controller {

	public function __construct() {
		parent::__construct();
	}

	public function index() {
		$this->vars['recaptcha_site_key'] = __session('recaptcha_site_key');
		$this->vars['page_title'] = 'Hubungi Kami';
		$this->vars['content'] = 'themes/'.theme_folder().'/contact-us';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}
}
