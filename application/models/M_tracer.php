<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_tracer extends CI_Model {

	public static $pk = 'id';

	public static $table = 'tracerstudy_junior';

	public function __construct() {
		parent::__construct();
	}

	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$this->db->select("");
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('nama', $keyword);
			$this->db->or_like('sekolah', $keyword);
			$this->db->or_like('year_id', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' id');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' id');
	}

	public function dropdown() {
		$query = $this->db
			->select("*")
			->join('academic_years', 'traserstudy_junior.year_id = academic_years.id', 'LEFT')
			->get(self::$table);
		$dataset = [];
		if ($query->num_rows() > 0) {
			foreach($query->result() as $row) {
				$dataset[$row->id] = $row->year_id;
			}
		}
		return $dataset;
	}
}
