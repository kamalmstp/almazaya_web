<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_tracer extends CI_Model {

	public static $pk = 'id';

	public static $table = 'tracerstudy_junior';

	public function __construct() {
		parent::__construct();
	}

	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$this->db->select("
			x1.id
			, x1.nama
			, x1.sekolah
			, x2.academic_year AS academic_year
			, x1.created_at
		");
		$this->db->join('academic_years x2', 'x1.academic_year = x2.id', 'LEFT');
		$this->db->order_by('id','desc');
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('nama', $keyword);
			$this->db->or_like('sekolah', $keyword);
			$this->db->or_like('academic_year', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}

	public function dropdown() {
		$query = $this->db
			->select("*")
			->join('academic_years', 'traserstudy_junior.academic_year = academic_years.id', 'LEFT')
			->get(self::$table);
		$dataset = [];
		if ($query->num_rows() > 0) {
			foreach($query->result() as $row) {
				$dataset[$row->id] = $row->academic_year;
			}
		}
		return $dataset;
	}
}
