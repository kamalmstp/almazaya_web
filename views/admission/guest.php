<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<?=link_tag('assets/plugins/magnific-popup/magnific-popup.css');?>
<script type="text/javascript" src="<?=base_url('assets/plugins/magnific-popup/magnific-popup.js')?>"></script>
<?php $this->load->view('backend/grid_index');?>
<script type="text/javascript">
DS.AdmissionTypes = _H.StrToObject('<?=get_options('admission_types')?>');
DS.Majors = _H.StrToObject('<?=$major_dropdown;?>');
DS.SpecialNeeds = _H.StrToObject('<?=get_options('special_needs')?>');
DS.Religions = _H.StrToObject('<?=get_options('religions')?>');
DS.Residences = _H.StrToObject('<?=get_options('residences')?>');
DS.Transportations = _H.StrToObject('<?=get_options('transportations')?>');
DS.MonthlyIncomes = _H.StrToObject('<?=get_options('monthly_incomes')?>');
DS.StudentStatus = _H.StrToObject('<?=get_options('student_status')?>');
DS.Employments = _H.StrToObject('<?=get_options('employments')?>');
DS.Educations = _H.StrToObject('<?=get_options('educations')?>');
var _grid = 'GUEST', _form = _grid + '_FORM', _form2 = _grid + '_FORM2';
var grid_fields = [
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
		header: '<i class="fa fa-search"></i>',
		renderer: function( row ) {
			return Ahref(_BASE_URL + 'admission/guest/profile/' + row.id, 'Preview', '<i class="fa fa-search"></i>');
		},
		exclude_excel: true,
		sorting: false
	},
	{ header:'Nama Lengkap', renderer:'full_name' },
	{ header:'Alamat', renderer:'address' },
	{ header:'No Handphone', renderer:'phone' },
	{ header:'Tanggal Daftar', renderer:'created_at' },
];
if (_MAJOR_COUNT > 0) {
	grid_fields.push(
		{ header:'Pilihan I', renderer:'first_choice' },
		{ header:'Pilihan II', renderer:'second_choice' }
	);
}
new GridBuilder( _grid , {
	controller:'admission/guest',
	fields: grid_fields,
	resize_column: 8,
	to_excel: false,
	can_add: false,
	extra_buttons: '<a class="btn btn-sm btn-default add" href="javascript:void(0)" onclick="admission_reports()" data-toggle="tooltip" data-placement="top" title="Export to Excel"><i class="fa fa-file-excel-o"></i></a>'
});

var form_fields = [];
if (_MAJOR_COUNT > 0) {
	form_fields.push(
		{ label:'Pilihan I', name:'first_choice_id', type:'select', datasource:DS.Majors },
		{ label:'Pilihan II', name:'second_choice_id', type:'select', datasource:DS.Majors }
	);
}
form_fields.push(
	{ label:'Nama Lengkap', name:'full_name', placeholder:'Nama Lengkap' },
	{ label:'Alamat', name:'address', placeholder:'Alamat' },
	{ label:'Nomor Telepon', name:'phone', placeholder:'Nomor Telepon' }
);
new FormBuilder( _form , {
	controller:'admission/guest',
	fields: form_fields
});

new FormBuilder( _form2 , {
	controller:'admission/guest',
	fields: [
		{ label:'Daftar Ulang ?', name:'re_registration', type:'select', datasource:DS.TrueFalse }
	],
	save_action: 'verified'
});

// Cetak Formulir Pendaftaran
function print_admission_form( id ) {
	$.post(_BASE_URL + 'admission/guest/print_admission_form', {'id':id}, function(response) {
		var res = _H.StrToObject(response);
		if (res.status == 'success') {
			window.open(_BASE_URL + 'media_library/students/' + res.file_name,'_self');
		}
		_H.Notify('error', 'Format data tidak valid.');
	}).fail(function(xhr) {
		console.log(xhr);
	});
}

function preview(image) {
	$.magnificPopup.open({
		items: {
			src: _BASE_URL + 'media_library/students/' + image
		},
		type: 'image'
	});
}

// Export All Field to Excel
function admission_reports() {
	var fields = {
		full_name: 'Nama Lengkap',
		created_at: 'Tanggal Pendaftaran',
		address: 'Alamat',
		phone: 'Telepon'
	};
	if (_MAJOR_COUNT == 0) {
		delete fields['first_choice'];
		delete fields['second_choice'];
	}
	$.post(_BASE_URL + 'admission/guest/admission_reports', {}, function(response) {
		var results = _H.StrToObject( response );
		var table = '<table>';
		table += '<tr>';
		for (var key in fields) {
			table += '<th>' + fields[ key ] + '</th>';
		}
		table += '</tr>'
		for (var x in results) {
			var res = results[ x ];
			table += '<tr>';
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
		var fileName = 'DATA-TAMU';
		_H.ExportToExcel( elementId, fileName ); // Export to Excel
	}).fail(function(xhr) {
		console.log(xhr);
	});
}
</script>
