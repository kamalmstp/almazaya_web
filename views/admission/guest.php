<?php defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('backend/grid_index');?>
<script type="text/javascript">
var _grid = 'GUEST', _form = _grid + '_FORM';
new GridBuilder( _grid , {
   controller:'admission/guest',
   fields: [
      {
         header: '<input type="checkbox" class="check-all">',
         renderer: function( row ) {
            return CHECKBOX(row.id, 'id');
         },
         exclude_excel: true,
         sorting: false
      },
      {
         header: '<i class="fa fa-edit"></i>',
         renderer: function( row ) {
            return A(_form + '.OnEdit(' + row.id + ')', 'Edit');
         },
         exclude_excel: true,
         sorting: false
      },
      { header:'Nama', renderer:'full_name' },
      { header:'Alamat', renderer:'address' },
      { header:'Nomor Telepon', renderer:'phone' },
      {
         header:'Tanggal',
         renderer: function( row ) {
            return row.created_at ? _H.ToIndonesianDate(row.created_at) : '';
         },
         sort_field: 'created_at'
      }
   ]
});

new FormBuilder( _form , {
   controller:'admission/guest',
   fields: [
      { label:'Nama', name:'full_name' },
      { label:'Alamat', name:'address', type:'textarea' },
      { label:'Nomor', name:'phone' },
      { label:'Tanggal', name:'created_at', type:'date' }
   ]
});
</script>
