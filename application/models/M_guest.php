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

class M_guest extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'guest';

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Get Data
	 * @param String $keyword
	 * @param String $return_type
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$this->db->select('x1.id, x1.full_name, x1.address, x1.phone, x1.created_at, x1.is_deleted');
		if ( ! empty($keyword) ) {
			$this->db->like('x1.full_name', $keyword);
			$this->db->or_like('x1.address', $keyword);
			$this->db->or_like('x1.phone', $keyword);
			$this->db->or_like('x1.created_at', $keyword);
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}

	/**
	 * Get Current Phase / Gelombang Pendaftaran
	 * @return Array
	 */
	public function get_current_phase() {
		$query = $this->db
			->select('id, full_name, address, phone, created_at')
			->where('CURDATE() >= created_at')
			->where('is_deleted', 'false')
			->order_by('created_at', 'DESC')
			->limit(1)
			->get(self::$table);
		if ($query->num_rows() === 1) {
			$res = $query->row();
			return [
				'id' => $res->id,
				'full_name' => $res->full_name,
				'address' => $res->address,
				'phone' => $res->phone,
				'created_at' => $res->created_at,
			];
		}
		return [];
	}

	/**
	 * Dropdown
	 * @return Array
	 */
	public function dropdown() {
		$query = $this->db
			->select('id, full_name, address, phone')
			->where('is_deleted', 'false')
			->order_by('full_name', 'DESC')
			->get(self::$table);
		$dataset = [];
		if ($query->num_rows() > 0) {
			foreach($query->result() as $row) {
				$dataset[$row->id] = $row->full_name;
			}
		}
		return $dataset;
	}
}
