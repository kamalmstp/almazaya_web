<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<?=link_tag('assets/plugins/magnific-popup/magnific-popup.css');?>
<script type="text/javascript" src="<?=base_url('assets/plugins/magnific-popup/magnific-popup.js')?>"></script>
<?php $this->load->view('backend/grid_index');?>
<script type="text/javascript">
DS.SpecialNeeds = _H.StrToObject('<?=get_options('special_needs')?>');
DS.Religions = _H.StrToObject('<?=get_options('religions')?>');
DS.Residences = _H.StrToObject('<?=get_options('residences')?>');
DS.Transportations = _H.StrToObject('<?=get_options('transportations')?>');
DS.MonthlyIncomes = _H.StrToObject('<?=get_options('monthly_incomes')?>');
DS.StudentStatus = _H.StrToObject('<?=get_options('student_status')?>');
DS.Employments = _H.StrToObject('<?=get_options('employments')?>');
DS.Educations = _H.StrToObject('<?=get_options('educations')?>');
DS.Majors = _H.StrToObject('<?=$major_dropdown;?>');
var _grid = 'STUDENTS', _form = _grid + '_FORM';
new GridBuilder( _grid , {
	controller:'tracer',
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
		{
			header: '<i class="fa fa-search-plus"></i>',
			renderer: function( row ) {
				var image = "'" + row.photo + "'";
				return row.photo ?
				'<a title="Preview" onclick="preview(' + image + ')"  href="#"><i class="fa fa-search-plus"></i></a>' : '';
			},
			exclude_excel: true,
			sorting: false
		},
		{
			header: '<i class="fa fa-search"></i>',
			renderer: function( row ) {
				return Ahref(_BASE_URL + 'tracer/profile/' + row.id, 'Preview', '<i class="fa fa-search"></i>');
			},
			exclude_excel: true,
			sorting: false
		},
		{ header:'Nama Lengkap', renderer:'nama' },
		{ header:'Nama Sekolah', renderer:'sekolah' },
		{ header:'Tahun Ajaran', renderer:'tahun_ajaran' }

	],
	resize_column: 7,
	to_excel: false,
	extra_buttons: '<button class="btn btn-default btn-sm add" onclick="tracer_reports()" data-toggle="tooltip" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o"></i></button>'
});

var form_fields = [];
form_fields.push(
	{ label:'Nama Lengkap', name:'nama' },
	{ label:'Nama Sekolah', name:'sekolah' },
	{ label:'Tahun Ajaran', name:'tahun_ajaran' }
);
new FormBuilder( _form , {
	controller:'tracer',
	fields: form_fields
});
 
// Export All Field to Excel
function tracer_reports() {
	var fields = {
		nama: 'Nama Lengkap',
		sekolah: 'Nama Sekolah',
		tahun_ajaran: 'Tahun Ajaran'
	};
	$.post(_BASE_URL + 'tracer/tracer_reports', {}, function(response) {
		var results = _H.StrToObject( response );
		var table = '<table>';
		table += '<tr>';
		for (var key in fields) {
			table += '<th>' + fields[ key ] + '</th>';
		}
		table += '</tr>'
		for (var x in results) {
			var res = results[ x ];
			table += '</tr>';
			for (var y in fields) {
				table += '<td>' + (res[ y ] ? res[ y ] : '-') + '</td>';
			}
			table += '</tr>';
		}
		table += '</table>';
		var elementId = 'excel-report';
		var div = '<div id="' + elementId + '" style="display: none;"></div>';
		$( div ).appendTo( document.body );
		$( '#' + elementId ).html( table );
		var fileName = 'LAPORAN-DATA-' + _STUDENT.toUpperCase();
		ExportToExcel( elementId, fileName ); // Export to Excel
	}).fail(function(xhr) {
		console.log(xhr);
	});
}
</script>
