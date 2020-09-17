<?php defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('backend/grid_index');?>
<script type="text/javascript">
DS.Academic_years = _H.StrToObject('<?=$academic_years_dropdown;?>');
var _grid = 'TRACER', _form = _grid + '_FORM';
new GridBuilder( _grid , {
   controller:'academic/tracer',
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
      { header:'Nama Lengkap', renderer:'nama' },
      { header:'Nama Sekolah', renderer:'sekolah' },
      { header:'Tahun Ajaran', renderer:'academic_year' }
   ]
});

var fields = [
   { label:'Nama', name:'nama' },
   { label:'Nama Sekolah', name:'sekolah' },
   { label:'Tahun Ajaran', name:'academic_year', type:'select', datasource:DS.Academic_years }
];

new FormBuilder( _form , {
   controller:'academic/tracer',
   fields: fields
});
</script>