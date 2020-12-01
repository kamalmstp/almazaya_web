<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Registrants_model_junior extends CI_Model
{
    private $_table = "registrants_junior";

    public $id;
    public $first_school_year;
    public $last_school_year;
    public $school_level;
    // public $major;
    public $full_name;
    public $gender;
    // public $nisn;
    // public $nkk;
    // public $nik;
    // public $akta_number;
    public $birth_place;
    public $birth_date;
    public $address;
    public $village;
    public $sub_district;
    public $district;
    public $prev_school;
    public $graduation_year;
    public $phone;
    public $father_name;
    // public $father_nik;
    // public $father_phone;
    public $father_employment;
    public $mother_name;
    // public $mother_nik;
    // public $mother_phone;
    public $mother_employment;
    public $created_at;
    // public $height;
    // public $weight;
    // public $head_cir;
    // public $mileage;
    // public $traveling_time;
    // public $sibling_number;

    public function rules()
    {
        return [
            ['field' => 'first_school_year',
            // 'label' => 'Name',
            'rules' => 'required'],

            ['field' => 'last_school_year',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'school_level',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'full_name',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'gender',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'birth_place',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'birth_date',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'address',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'father_name',
            // 'label' => 'Price',
            'rules' => 'required'],

            ['field' => 'mother_name',
            // 'label' => 'Price',
            'rules' => 'required']
        ];
    }

    // public function getAll()
    // {
    //     return $this->db->get($this->_table)->result();
    // }
    
    // public function getById($id)
    // {
    //     return $this->db->get_where($this->_table, ["product_id" => $id])->row();
    // }

    public function save()
    {
        $post = $this->input->post();
        $this->first_school_year = $post["first_school_year"];
        $this->last_school_year = $post["last_school_year"];
        $this->school_level = "SMP";
        // $this->major = $post["major"];
        $this->full_name = $post["full_name"];
        $this->gender = $post["gender"];
        // $this->nisn = $post["nisn"];
        // $this->nkk = $post["nkk"];
        // $this->nik = $post["nik"];
        // $this->akta_number = $post["akta_number"];
        $this->birth_place = $post["birth_place"];
        $this->birth_date = $post["birth_date"];
        $this->address = $post["address"];
        $this->village = $post["village"];
        $this->sub_district = $post["sub_district"];
        $this->district = $post["district"];
        $this->prev_school = $post["prev_school"];
        $this->graduation_year = $post["graduation_year"];
        $this->phone = $post["phone"];
        $this->father_name = $post["father_name"];
        // $this->father_nik = $post["father_nik"];
        // $this->father_phone = $post["father_phone"];
        $this->father_employment = $post["father_employment"];
        $this->mother_name = $post["mother_name"];
        // $this->mother_nik = $post["mother_nik"];
        // $this->mother_phone = $post["mother_phone"];
        $this->mother_employment = $post["mother_employment"];
        $this->created_at = date('Y-m-d');
        // $this->height = $post["height"];
        // $this->weight = $post["weight"];
        // $this->head_cir = $post["head_cir"];
        // $this->mileage = $post["mileage"];
        // $this->traveling_time = $post["traveling_time"];
        // $this->sibling_number = $post["sibling_number"];
        return $this->db->insert($this->_table, $this);
    }

    // public function update()
    // {
    //     $post = $this->input->post();
    //     $this->product_id = $post["id"];
    //     $this->name = $post["name"];
    //     $this->price = $post["price"];
    //     $this->description = $post["description"];
    //     return $this->db->update($this->_table, $this, array('product_id' => $post['id']));
    // }

    // public function delete($id)
    // {
    //     return $this->db->delete($this->_table, array("product_id" => $id));
    // }
}