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

class M_registrants extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'registrants_junior';

	/**
	 * Admission Year
	 * @var Integer
	 */
	public $admission_year;

	/**
	 * Class Constructor
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		// $year = __session('admission_year');
		// $this->admission_year = (NULL !== $year && $year > 0) ? $year : date('Y');
	}

	/**
	 * Display a listing of the resource.
	 * @param String $keyword
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$fields = [
			"x1.id"
			// , "x1.registration_number"
			// , "x1.re_registration"
			, "x1.created_at"
			, "x1.full_name"
			, "x1.birth_date"
			, "IF(x1.gender = 'M', 'L', 'P') AS gender"
			, "x1.photo"
			, "x1.school_level"
			, "x1.is_deleted"
		];
		// if (__session('major_count') > 0) {
		// 	array_push($fields, 'x2.major_name AS first_choice');
		// 	array_push($fields, 'x3.major_name AS second_choice');
		// }
		$this->db->select(implode(', ', $fields));
		// if (__session('major_count') > 0) {
		// 	$this->db->join('majors x2', 'x1.first_choice_id = x2.id', 'LEFT');
		// 	$this->db->join('majors x3', 'x1.second_choice_id = x3.id', 'LEFT');
		// }
		// $this->db->where('x1.is_prospective_student', 'true');
		// $this->db->where('LEFT(x1.registration_number, 4) = ', $this->admission_year);
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			// $this->db->like('x1.registration_number', $keyword);
			// $this->db->or_like('x1.re_registration', $keyword);
			// $this->db->or_like('x1.created_at', $keyword);
			// if (__session('major_count') > 0) {
			// 	$this->db->or_like('x2.major_name', $keyword);
			// 	$this->db->or_like('x3.major_name', $keyword);
			// }
			// $this->db->or_like('x1.full_name', $keyword);
			// $this->db->or_like('x1.gender', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}

	/**
	 * insert
	 * @param Int $selection_result
	 * @param Array $registration_number
	 * @return Boolean
	 */
	public function insert($selection_result, array $registration_number = []) {
		$approved = 0;
		$unapproved = 0;
		$error = 0;
		foreach($registration_number as $reg_number) {
			if ($selection_result != 'unapproved') {
				if ($this->check_quota($reg_number)) {
					$query = $this->db
						->where('registration_number', $reg_number)
						->update(self::$table, ['selection_result' => $selection_result]);
					$query ? $approved++ : $error++;
				} else {
					$unapproved++;
				}
			} else {
				$query = $this->db
					->where('registration_number', $reg_number)
					->update(self::$table, ['selection_result' => $selection_result]);
				$query ? $approved++ : $error++;
			}
		}
		$response = 'Sukses : '.$approved. ' SQL Error : '. $error.', Gagal : ' . $unapproved;
		return $response;
	}

	/**
	 * check_quota
	 * @access 	private
	 * @param String
	 * @return Boolean
	 */
	private function check_quota($registration_number) {
		// Get First Choice
		if (__session('major_count') > 0) {
			$student = $this->db
				->select('first_choice_id')
				->where('registration_number', $registration_number)
				->get(self::$table)
				->row();
		}

		// Set Default Quota
		$quota = 0;
		// Get Quota
		$this->db->select('quota');
		$this->db->where('year', $this->admission_year);
		// If SMK or PT
		if (__session('major_count') > 0) {
			$this->db->where('major_id', $student->first_choice_id);
		}
		$this->db->limit(1);
		$query = $this->db->get('admission_quotas');
		if ($query->num_rows() === 1) {
			$result = $query->row();
			$quota = $result->quota;
		}

		// Get Approved Students
		$approved = $this->db
			->where('is_prospective_student', 'true')
			->where('selection_result IS NOT NULL')
			->where('selection_result !=', 'unapproved')
			->where('LEFT(registration_number, 4) = ', $this->admission_year)
			->count_all_results(self::$table);
		return $quota > $approved;
	}

	/**
	 * Generate Registration Number
	 * @return Boolean
	 */
	public function registration_number() {
		$admission_year = $this->admission_year;
		$query = $this->db->query("
			SELECT MAX(RIGHT(registration_number, 6)) AS max_number
			FROM students
			WHERE is_prospective_student='true'
			AND LEFT(registration_number, 4) = ?
		", [$admission_year]);
		$registration_number = "000001";
		if ($query->num_rows() === 1) {
			$data = $query->row();
			$number = ((int) $data->max_number) + 1;
			$registration_number = sprintf("%06s", $number);
		}
		return $admission_year . $registration_number;
	}

	/**
	 * Selection Result
	 * @param String $registration_number
	 * @param String $birth_date
	 * @return Array
	 */
	public function selection_result($registration_number, $birth_date) {
		$query = $this->db
			->where('registration_number', $registration_number)
			->where('birth_date', $birth_date)
			->get(self::$table);
		if ($query->num_rows() === 1) {
			$result = $query->row();
			if (is_null($result->selection_result)) {
				$response['status'] = 'info';
				$response['message'] = 'Proses seleksi belum dimulai';
			}
			if ($result->selection_result === 'unapproved') {
				$response['status'] = 'warning';
				$response['message'] = 'Anda Tidak Lolos Seleksi Penerimaan Peserta Didik Baru '.__session('school_name');
			} else {
				$response['status'] = 'success';
				if (__session('major_count') > 0) {
					$majors = $this->model->RowObject('id', $result->selection_result, 'majors');
					$response['message'] = 'Anda Lolos Seleksi Penerimaan Peserta Didik Baru dan diterima di ' . __session('_major') . ' ' . $majors->major_name . ' ' . __session('school_name');
				} else {
					$response['message'] = 'Anda Lolos Seleksi Penerimaan Peserta Didik Baru '.__session('school_name');
				}
			}
		} else {
			$response['status'] = 'warning';
			$response['message'] = 'Data Anda tidak terdaftar pada database kami';
		}
		return $response;
	}

	/**
	 * Find Registrant
	 * @param String $registration_number
	 * @param String $birth_date
	 * @return Array
	 */
	public function find_registrant($id, $birth_date) {
		$this->db->select("
			x1.id
		  , x1.created_at
		  , x1.prev_school
		  , x1.full_name
		  , IF(x1.gender = 'M', 'Laki-laki', 'Perempuan') AS gender
		  , x1.birth_place
		  , x1.birth_date
		  , x1.address
		  , x1.sub_district
		  , x1.district
		  , x1.village
		");
		// $this->db->join('majors x2', 'x1.first_choice_id = x2.id', 'LEFT');
		// $this->db->join('majors x3', 'x1.second_choice_id = x3.id', 'LEFT');
		// $this->db->join('options x4', 'x1.religion_id = x4.id', 'LEFT');
		// $this->db->join('options x5', 'x1.special_need_id = x5.id', 'LEFT');
		// $this->db->join('options x6', 'x1.admission_type_id = x6.id', 'LEFT');
		$this->db->where('x1.id', $id);
		$this->db->where('x1.birth_date', $birth_date);
		return $this->db->get(self::$table.' x1')->row_array();
	}

	/**
	 * Is Valid Registrant
	 * @param String $registration_number
	 * @param String $birth_date
	 * @return Boolean
	 */
	public function is_valid_registrant($id, $birth_date) {
		$this->db->where('id', $id);
		$this->db->where('birth_date', $birth_date);
		$count = $this->db->count_all_results(self::$table);
		return $count > 0;
	}

	public function registrant_query() {
		return "
			SELECT x1.id
				-- a, x2.major_name
				-- , x3.major_name AS first_choice
				-- , x4.major_name AS second_choice
				-- , x1.registration_number
				, x1.first_school_year
				, x1.last_school_year
				, x1.created_at
				-- , x1.admission_exam_number
				-- , x1.prev_exam_number
				-- , CASE WHEN x1.selection_result IS NULL THEN 'Belum Diseleksi'
				-- 	WHEN x1.selection_result = 'approved' THEN 'Diterima'
				-- 	WHEN x1.selection_result = 'unapproved' THEN 'Tidak Diterima'
				-- 	WHEN x1.selection_result > 0 THEN (SELECT major_name FROM majors WHERE id = x1.selection_result)
				-- 	ELSE '-'
				-- 	END AS selection_result
				, CASE WHEN x1.is_approved = 'true' THEN 'Diterima'
					WHEN x1.is_approved = 'false' THEN 'Tidak Diterima'
					ELSE 'Belum Diseleksi'
					END AS is_approved
				-- , x1.is_approved
				-- , x5.phase_name
				-- , x6.option_name AS admission_type
				, x1.photo
				-- , IF(x1.is_transfer = 'true', 'Pindahan', 'Baru') AS is_transfer
				-- , x1.achievement
				-- , IF(x1.re_registration = 'true', 'Ya', 'Tidak') AS re_registration
				-- , x1.start_date
				-- , x1.identity_number
				-- , x1.nisn
				-- , x1.nik
				-- , x1.prev_diploma_number
				-- , IF(x1.paud = 'true', 'Ya', 'Tidak') AS paud
				-- , IF(x1.tk = 'true', 'Ya', 'Tidak') AS tk
				-- , x1.skhun
				-- , x1.prev_school_name
				, x1.prev_school
				, x1.graduation_year
				-- , x1.prev_school_address
				-- , x1.hobby
				-- , x1.ambition
				, x1.full_name
				, IF(x1.gender = 'M', 'Laki-laki', 'Perempuan') AS gender
				, x1.birth_place
				, x1.birth_date
				-- , x7.option_name AS religion
				-- , x8.option_name AS special_need
				, x1.address
				-- , x1.rt
				-- , x1.rw
				-- , x1.sub_village
				, x1.village
				, x1.sub_district
				, x1.district
				-- , x1.postal_code
				-- , x9.option_name AS residence
				-- , x10.option_name AS transportation
				, x1.phone
				-- , x1.mobile_phone
				-- , x1.email
				-- , x1.sktm
				-- , x1.kks
				-- , x1.kps
				-- , x1.kip
				-- , x1.kis
				-- , x1.citizenship
				-- , x1.country
				, x1.father_name
				-- , x1.father_birth_year
				-- , x11.option_name AS father_education
				, x12.option_name AS father_employment
				-- , x13.option_name AS father_monthly_income
				-- , x14.option_name AS father_special_need
				, x1.mother_name
				-- , x1.mother_birth_year
				-- , x15.option_name AS mother_education
				, x16.option_name AS mother_employment
				-- , x17.option_name AS mother_monthly_income
				-- , x18.option_name AS mother_special_need
				-- , x1.guardian_name
				-- , x1.guardian_birth_year
				-- , x19.option_name AS guardian_education
				-- , x20.option_name AS guardian_employment
				-- , x21.option_name AS guardian_monthly_income
				-- , x1.mileage
				-- , x1.traveling_time
				-- , x1.height
				-- , x1.weight
				-- , x1.sibling_number
				-- , x1.status
				-- , x1.end_date
				-- , x1.reason
			FROM registrants_junior x1
			-- LEFT JOIN majors x2 ON x1.major_id = x2.id
			-- LEFT JOIN majors x3 ON x1.first_choice_id = x3.id
			-- LEFT JOIN majors x4 ON x1.second_choice_id = x4.id
			-- LEFT JOIN admission_phases x5 ON x1.admission_phase_id = x5.id
			-- LEFT JOIN options x6 ON x1.admission_type_id = x6.id
			-- LEFT JOIN options x7 ON x1.religion_id = x7.id
			-- LEFT JOIN options x8 ON x1.special_need_id = x8.id
			-- LEFT JOIN options x9 ON x1.residence_id = x9.id
			-- LEFT JOIN options x10 ON x1.transportation_id = x10.id
			-- LEFT JOIN options x11 ON x1.father_education_id = x11.id
			LEFT JOIN options x12 ON x1.father_employment = x12.id
			-- LEFT JOIN options x13 ON x1.father_monthly_income_id = x13.id
			-- LEFT JOIN options x14 ON x1.father_special_need_id = x14.id
			-- LEFT JOIN options x15 ON x1.mother_education_id = x15.id
			LEFT JOIN options x16 ON x1.mother_employment = x16.id
			-- LEFT JOIN options x17 ON x1.mother_monthly_income_id = x17.id
			-- LEFT JOIN options x18 ON x1.mother_special_need_id = x18.id
			-- LEFT JOIN options x19 ON x1.guardian_education_id = x19.id
			-- LEFT JOIN options x20 ON x1.guardian_employment_id = x20.id
			-- LEFT JOIN options x21 ON x1.guardian_monthly_income_id = x21.id
			-- LEFT JOIN options x22 ON x1.student_status_id = x22.id
			WHERE 1=1
		";
	}

	public function admission_reports() {
		// $this->load->model('m_students');
		$query = $this->registrant_query();
		$query .= "
		AND x1.is_deleted='false'
		ORDER BY x1.id, x1.full_name ASC";
		return $this->db->query($query);
	}

	public function profile($id) {
		// $this->load->model('m_students');
		// $query = $this->m_students->student_query();
		$query = $this->registrant_query();
		$query .= '
		AND x1.id = ?
		';
		return $this->db->query($query, [_toInteger($id)])->row();
	}
}
