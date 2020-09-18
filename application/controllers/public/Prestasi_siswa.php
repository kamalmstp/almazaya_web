<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Prestasi_siswa extends Public_Controller {

	public function __construct() {
		parent::__construct();
	}

	public function index() {
		$this->db->select("*");
		$this->db->from("prestasi");
		$data = $this->db->get();

		$this->vars['data'] = $data->result_array();
		$this->vars['recaptcha_site_key'] = __session('recaptcha_site_key');
		$this->vars['page_title'] = 'Prestasi Siswa';
		$this->vars['content'] = 'themes/'.theme_folder().'/prestasi_siswa';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}
}
