<?php if ($this->session->has_userdata('success')) { ?>
                  <script type="text/javascript">alert("<?= $this->session->flashdata('success'); ?>")</script>
                <?php } ?>
<div class="col-lg-12 col-md-12 col-sm-12 ">
	<h5 class="page-title mb-3"><?=strtoupper($page_title)?></h5>
	<div class="card rounded-0 border border-secondary mb-3">
			<form action="<?= base_url() ?>/public/admission_form/registration" method="POST">
		<div class="card-body">
				<h6 class="page-title mb-3">Registrasi <?=__session('_student')?></h6>
                <div class="form-group row mb-2">
                  <label class="col-sm-4 control-label">Tahun Ajaran <span style="color: red">*</span></label>
                  <!-- <div class="row"> -->
                    <div class="col-sm-2">
                      <input type="number" required="" name="first_school_year" class="form-control form-control-sm rounded-0 border border-secondary" id="first_school_year" placeholder="" value="<?=date("Y")?>">
                    </div>
                    <div class="col-sm-1" style="font-size: 24px; text-align: center; width: 39px;">/</div>
                    <div class="col-sm-2">
                      <input type="number" required="" name="last_school_year" class="form-control form-control-sm rounded-0 border border-secondary" id="last_school_year" placeholder="" value="<?=date("Y")+1?>">
                    </div>
                  <!-- </div> -->
                </div>
				<!-- <div class="form-group row mb-2">
					<label for="is_transfer" class="col-sm-4 control-label">Jenis Pendaftaran <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('is_transfer', ['' => 'Pilih :', 'false' => 'Baru', 'true' => 'Pindahan'], set_value('is_transfer'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="is_transfer"')?>
					</div>
				</div>

				<div class="form-group row mb-2">
					<label for="admission_type_id" class="col-sm-4 control-label">Jalur Pendaftaran <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('admission_type_id', $admission_types, set_value('admission_type_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="admission_type_id"')?>
					</div>
				</div>

				<div class="form-group row mb-2">
					<label for="admission_type_id" class="col-sm-4 control-label">Jalur Pendaftaran <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<select>
							<option></option>
						</select>
					</div>
				</div> -->

				<!-- Khusus SMA/SMK/PT -->
				<!-- <?php if (__session('major_count') > 0) { ?>
					<div class="form-group row mb-2">
						<label for="first_choice_id" class="col-sm-4 control-label">Pilihan I (Satu) <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<?=form_dropdown('first_choice_id', $majors, set_value('first_choice_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="first_choice_id" onchange="check_options(1)" onblur="check_options(1)" onmouseup="check_options(1)"')?>
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="second_choice_id" class="col-sm-4 control-label">Pilihan II (Dua) <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<?=form_dropdown('second_choice_id', $majors, set_value('second_choice_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="second_choice_id" onchange="check_options(2)" onblur="check_options(2)" onmouseup="check_options(2)"')?>
						</div>
					</div>
				<?php } ?> -->

				<!-- Khusus SMP/Sederajat dan SMA/Sederajat -->
				<?php if (__session('school_level') == 2 || __session('school_level') == 3 || __session('school_level') == 4) { ?>
					<div class="form-group row mb-2">
						<label for="prev_school" class="col-sm-4 control-label">Asal Sekolah <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="text" value="<?php echo set_value('prev_school')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="prev_school" name="prev_school">
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="graduation_year" class="col-sm-4 control-label">Tahun Kelulusan <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="number" value="<?php echo set_value('graduation_year')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="graduation_year" name="graduation_year">
						</div>
					</div>
				<?php } ?>
				<!-- <div class="form-group row mb-2">
					<label for="hobby" class="col-sm-4 control-label">Hobi</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('hobby')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="hobby" name="hobby">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="ambition" class="col-sm-4 control-label">Cita-cita</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('ambition')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="ambition" name="ambition">
					</div>
				</div> -->

				<!-- Biodata -->
				<h6 class="page-title mb-3">Data Pribadi</h6>
				<div class="form-group row mb-2">
					<label for="full_name" class="col-sm-4 control-label">Nama Lengkap <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('full_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="full_name" name="full_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="gender" class="col-sm-4 control-label">Jenis Kelamin <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<!-- <?=form_dropdown('gender', ['' => 'Pilih :', 'M' => 'Laki-laki', 'F' => 'Perempuan'], '', 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="gender"')?> -->
                      <select name="gender" class="custom-select custom-select-sm rounded-0 border border-secondary" required>
                          <option value="">-- Pilih : --</option>
                          <option value="Laki-laki">&nbsp;Laki-laki</option>
                          <option value="Perempuan">&nbsp;Perempuan</option>
                      </select>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="birth_place" class="col-sm-4 control-label">Tempat Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('birth_place')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="birth_place" name="birth_place">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="birth_date" class="col-sm-4 control-label">Tanggal Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" readonly class="form-control form-control-sm rounded-0 border border-secondary date" id="birth_date" name="birth_date">
							<div class="input-group-append">
								<span class="btn btn-sm btn-outline-secondary rounded-0"><i class="fa fa-calendar text-dark"></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group row mb-2">
					<label for="address" class="col-sm-4 control-label">Alamat <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<textarea rows="4" name="address" id="address" class="form-control form-control-sm rounded-0 border border-secondary"><?php echo set_value('address')?></textarea>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="village" class="col-sm-4 control-label">Nama Kelurahan / Desa</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('village')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="village" name="village">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="sub_district" class="col-sm-4 control-label">Kecamatan</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('sub_district')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="sub_district" name="sub_district">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="district" class="col-sm-4 control-label">Kabupaten</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('district')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="district" name="district">
					</div>
				</div>
				<!-- <div class="form-group row mb-2">
					<label for="mobile_phone" class="col-sm-4 control-label">Nomor HP <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('mobile_phone')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mobile_phone" name="mobile_phone">
					</div>
				</div> -->
				<div class="form-group row mb-2">
					<label for="phone" class="col-sm-4 control-label">Nomor Telepon / HP</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('phone')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="phone" name="phone">
					</div>
				</div>

				<!-- Ayah -->
				<h6 class="page-title mb-3">Data Ayah Kandung</h6>
				<div class="form-group row mb-2">
					<label for="father_name" class="col-sm-4 control-label">Nama Ayah Kandung <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('father_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="father_name" name="father_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_employment" class="col-sm-4 control-label">Pekerjaan</label>
					<div class="col-sm-8">
						<!-- <?=form_dropdown('father_employment', $employments, set_value('father_employment'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="father_employment"')?> -->
                      <select name="father_employment" class="custom-select custom-select-sm rounded-0 border border-secondary" required>
                          <option value="">-- Pilih : --</option>
                          <option>Buruh</option>
                          <option>Karyawan Swasta</option>
                          <option>Nelayan</option>
                          <option>Pedagang Besar</option>
                          <option>Pedagang Kecil</option>
                          <option>Pensiunan</option>
                          <option>Petani</option> 
                          <option>Peternak</option> 
                          <option>PNS/TNI/POLISI</option>   
                          <option>Wiraswasta</option>
                          <option>Wirausaha</option>
                          <option>Tidak Bekerja</option>
                          <option>Lain-Lain</option> 
                      </select>
					</div>
				</div>

				<!-- Ibu -->
				<h6 class="page-title mb-3">Data Ibu Kandung</h6>
				<div class="form-group row mb-2">
					<label for="mother_name" class="col-sm-4 control-label">Nama Ibu Kandung <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('mother_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mother_name" name="mother_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_employment" class="col-sm-4 control-label">Pekerjaan</label>
					<div class="col-sm-8">
						<!-- <?=form_dropdown('mother_employment', $employments, set_value('mother_employment'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="mother_employment"')?> -->
                      <select name="mother_employment" class="custom-select custom-select-sm rounded-0 border border-secondary" required>
                          <option value="">-- Pilih : --</option>
                          <option>Buruh</option>
                          <option>Karyawan Swasta</option>
                          <option>Nelayan</option>
                          <option>Pedagang Besar</option>
                          <option>Pedagang Kecil</option>
                          <option>Pensiunan</option>
                          <option>Petani</option> 
                          <option>Peternak</option> 
                          <option>PNS/TNI/POLISI</option>   
                          <option>Wiraswasta</option>
                          <option>Wirausaha</option>
                          <option>Tidak Bekerja</option>
                          <option>Lain-Lain</option> 
					</select>
					</div>
				</div>
<!-- 
				<h6 class="page-title mb-3">Pernyataan dan Keamanan</h6>
				<div class="form-group row mb-2">
					<label for="declaration" class="col-sm-4 control-label">Pernyataan <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="declaration" id="declaration">
							<label class="form-check-label" for="declaration">
								Saya menyatakan dengan sesungguhnya bahwa isian data dalam formulir ini adalah benar. Apabila ternyata data tersebut tidak benar / palsu, maka saya bersedia menerima sanksi berupa <strong>Pembatalan</strong> sebagai <strong>Calon <?=__session('school_level') == 5 ? 'Mahasiswa' : 'Peserta Didik' ?></strong> <?=__session('school_name')?>
							</label>
						</div>
					</div>
				</div> -->
				<div class="form-group row mb-2">
					<label class="col-sm-4 control-label"></label>
					<div class="col-sm-8">
						<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
					</div>
				</div>
		</div>
		<div class="card-footer">
			<div class="form-group row mb-0">
				<div class="offset-sm-4 col-sm-8">
					<button type="submit" class="btn action-button rounded-0"><i class="fa fa-send"></i> Simpan Formulir Pendaftaran</button>
				</div>
			</div>
		</div>
			</form>
	</div>
</div>
