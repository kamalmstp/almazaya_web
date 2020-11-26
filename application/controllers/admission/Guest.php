<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * CMS Sekolahku | CMS (Content Management System) dan PPDB/PMB Online GRATIS
 * untuk sekolah SD/Sederajat, SMP/Sederajat, SMA/Sederajat, dan Perguruan Tinggi
 * @version    2.4.8
 * @author     Anton Sofyan | https://facebook.com/antonsofyan | 4ntonsofyan@gmail.com | 0857 5988 8922
 * @copyright  (c) 2014-2020
 * @link       https://sekolahku.web.id
 *
 * PERINGATAN :
 * 1. TIDAK DIPERKENANKAN MENGGUNAKAN CMS INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 2. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 3. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
 */

class Guest extends Admin_Controller {

	/**
	 * Class Constructor
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model(['m_guest', 'm_majors']);
		$this->pk = M_guest::$pk;
		$this->table = M_guest::$table;
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->vars['title'] = 'List Buku Tamu';
		$this->vars['admission'] = $this->vars['guest'] = TRUE;
		$this->vars['major_dropdown'] = json_encode([]);
		if (__session('major_count') > 0) {
			$this->vars['major_dropdown'] = json_encode($this->m_majors->dropdown(), JSON_HEX_APOS | JSON_HEX_QUOT);
		}
		$this->vars['content'] = 'admission/guest';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	 * Pagination
	 * @return Object
	 */
	public function pagination() {
		if ($this->input->is_ajax_request()) {
			$keyword = trim($this->input->post('keyword', true));
			$page_number = _toInteger($this->input->post('page_number', true));
			$limit = _toInteger($this->input->post('per_page', true));
			$offset = ($page_number * $limit);
			$query = $this->m_guest->get_where($keyword, 'rows', $limit, $offset);
			$total_rows = $this->m_guest->get_where($keyword);
			$total_page = $limit > 0 ? ceil(_toInteger($total_rows) / _toInteger($limit)) : 1;
			$this->vars['total_page'] = _toInteger($total_page);
			$this->vars['total_rows'] = _toInteger($total_rows);
			$this->vars['rows'] = $query->result();
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	 * Save | Update
	 * @return Object
	 */
	public function save() {
		if ($this->input->is_ajax_request()) {
			$id = _toInteger($this->input->post('id', true));
			if ($this->validation( $id )) {
				$dataset = $this->dataset();
				if (!_isNaturalNumber( $id )) $dataset['created_at'] = date('Y-m-d H:i:s');
				$query = $this->model->upsert($id, $this->table, $dataset);
				$this->vars['status'] = $query ? 'success' : 'error';
				$this->vars['message'] = $query ? 'Data Anda berhasil disimpan.' : 'Terjadi kesalahan dalam menyimpan data';
			} else {
				$this->vars['status'] = 'error';
				$this->vars['message'] = validation_errors();
			}
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	 * Verified prospective studnets
	 * @return 	Object
	 */
	public function verified() {
		if ($this->input->is_ajax_request()) {
			$id = _toInteger($this->input->post('id', true));
			$this->vars['status'] = $this->model->update($id, $this->table, $dataset) ? 'success' : 'error';
			$this->vars['message'] = $this->vars['status'] == 'success' ? 'updated' : 'not_updated';
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	 * Dataset
	 * @return Array
	 */
	private function dataset() {
		return [
			'full_name' => $this->input->post('full_name', true),
			'address' => $this->input->post('address', true),
			'phone' => $this->input->post('phone', true),
		];
	}

	/**
	 * Validation Form
	 * @return Boolean
	 */
	private function validation( $id = 0 ) {
		$this->load->library('form_validation');
		$val = $this->form_validation;
		$val->set_rules('full_name', 'Nama Lengkap', 'trim|required');
		$val->set_error_delimiters('<div>&sdot; ', '</div>');
		return $val->run();
	}

	/**
	 * Email Exists ?
	 * @param String $email
	 * @param Integer $id
	 * @return Boolean
	 */
	public function email_exists( $email, $id ) {
		$this->load->model('m_users');
		$query = $this->m_users->get_email_accounts();
		$emails = [];
		foreach($query->result() as $row) {
			$emails[] = [
				'id' => $row->id,
				'email' => $row->email,
				'user_type' => $row->user_type,
			];
		}
		$email_exists = FALSE;
		foreach($emails as $data) {
			if ( ($data['id'] != $id && $data['email'] == $email && $data['user_type'] == 'is_student') OR
				($data['email'] == $email && $data['user_type'] == 'is_employee') OR
				($data['email'] == $email && $data['user_type'] == 'is_admin') OR
				($data['email'] == $email && $data['user_type'] == 'is_super_user')) {
				$email_exists = TRUE;
				break;
			}
		}
		if ( $email_exists ) {
			$this->form_validation->set_message('email_exists', 'Email sudah digunakan');
			return FALSE;
		}
		return TRUE;
	}

	/**
	 * Upload
	 * @return Void
	 */
	public function upload() {
		if ($this->input->is_ajax_request()) {
			$id = _toInteger($this->input->post('id', true));
			if (_isNaturalNumber( $id )) {
				$query = $this->model->RowObject($this->pk, $id, $this->table);
				$file_name = $query->photo;
				$config = [];
				$config['upload_path'] = './media_library/students/';
				$config['allowed_types'] = 'jpg|png|jpeg|gif';
				$config['max_size'] = 0;
				$config['encrypt_name'] = TRUE;
				$this->load->library('upload', $config);
				if ( ! $this->upload->do_upload('file') ) {
					$this->vars['status'] = 'error';
					$this->vars['message'] = $this->upload->display_errors();
				} else {
					$file = $this->upload->data();
					$update = $this->model->update($id, $this->table, ['photo' => $file['file_name']]);
					if ($update) {
						// chmood new file
						@chmod(FCPATH.'media_library/students/'.$file['file_name'], 0777);
						// chmood old file
						@chmod(FCPATH.'media_library/students/'.$file_name, 0777);
						// unlink old file
						@unlink(FCPATH.'media_library/students/'.$file_name);
						// resize new image
						$this->resize_image(FCPATH.'media_library/students', $file['file_name']);
					}
					$this->vars['status'] = 'success';
					$this->vars['message'] = 'uploaded';
				}
			} else {
				$this->vars['status'] = 'error';
				$this->vars['message'] = 'ID bukan merupakan tipe angka yang valid !';
			}
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	  * Resize Image
	  * @param String $source
	  * @param String $file_name
	  * @return Void
	  */
	 private function resize_image($source, $file_name) {
		$this->load->library('image_lib');
		$config['image_library'] = 'gd2';
		$config['source_image'] = $source .'/'.$file_name;
		$config['maintain_ratio'] = false;
		$config['width'] = (int) __session('student_photo_width');
		// $config['height'] = (int) __session('student_photo_height');
		$this->image_lib->initialize($config);
		$this->image_lib->resize();
	}

	/**
	  * Print PDF Registration Form
	  */
	public function print_admission_form() {
		if ($this->input->is_ajax_request()) {
			$id = _toInteger($this->input->post('id', true));
			$query = $this->model->RowObject($this->pk, $id, $this->table);
			if (_isNaturalNumber( $id )) {
				$this->load->model('m_guest');
				$guest = $this->m_guest->find_guest($query->guest_number);
				if (count($guest) == 0) {
					$this->vars['status'] = 'warning';
					$this->vars['message'] = 'Data dengan nomor pendaftaran '.$query->guest_number.' tidak ditemukan.';
				} else {
					$file_name = 'formulir-penerimaan-'. (__session('school_level') >= 5 ? 'mahasiswa' : 'peserta-didik').'-baru-tahun-'.__session('admission_year');
					$file_name .= '-'.$query->guest_number.'.pdf';
					$this->load->library('admission');
					$this->admission->create_pdf($guest, $file_name);
					$this->vars['file_name'] = $file_name;
					$this->vars['status'] = 'success';
				}
			} else {
				$this->vars['status'] = 'error';
				$this->vars['message'] = 'Format data tidak valid.';
			}
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	 * Admission Reports
	 * @return Object
	 */
	public function admission_reports() {
		if ($this->input->is_ajax_request()) {
			$query = $this->m_guest->admission_reports();
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($query->result(), JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}

	/**
	 * Profile
	 * @return Void
	 */
	public function profile() {
		$id = _toInteger($this->uri->segment(4));
		if (_isNaturalNumber( $id )) {
			$this->load->model(['m_guest']);
			$this->vars['student'] = $this->m_guest->profile($id);
			$this->vars['title'] = 'Profil Tamu';
			$this->vars['photo'] = base_url('media_library/images/no-image.png');
			$this->vars['scholarships'] = $this->vars['achievements'] = FALSE;
			$photo_name = $this->vars['student']->photo;
			$photo = 'media_library/students/' . $photo_name;
			if ($photo_name && file_exists($_SERVER['DOCUMENT_ROOT'] . '/' . $photo)) {
				$this->vars['photo'] = base_url($photo);
			}
			$this->vars['admission'] = $this->vars['guest'] = TRUE;
			$this->vars['content'] = 'admission/student_profile';
			$this->load->view('backend/index', $this->vars);
		} else {
			show_404();
		}
	}
}
