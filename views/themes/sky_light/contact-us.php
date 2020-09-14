<style type="text/css">
.mapouter {
	position:relative;
	text-align:right;
}
.gmap_canvas {
	overflow:hidden;
	background:none!important;
}
</style>
<div class="col-lg-8 col-md-8 col-sm-12 ">
	<h5 class="page-title mb-3"><?=strtoupper($page_title)?></h5>
	<div class="mapouter border border-secondary mb-3">
		<div class="gmap_canvas">
			<!-- <?=__session('map_location') ?> -->
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.1027843881548!2d114.58001931428657!3d-3.3247756421830923!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2de423d0ed3b00b9%3A0x1e355c4ecd2abecb!2sAl%20Mazaya%20Junior%20High%20School%20Islamic%20School!5e0!3m2!1sen!2sid!4v1585804373538!5m2!1sen!2sid" width="900" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		</div>
	</div>
	<div class="card rounded-0 border border-secondary mb-3">
		<div class="card-body">
			<div class="form-group row mb-2">
				<label for="comment_author" class="col-sm-3 control-label">Nama Lengkap <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_author" name="comment_author">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_email" class="col-sm-3 control-label">Email <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_email" name="comment_email">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_url" class="col-sm-3 control-label">URL</label>
				<div class="col-sm-9">
					<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="comment_url" name="comment_url">
				</div>
			</div>
			<div class="form-group row mb-2">
				<label for="comment_content" class="col-sm-3 control-label">Pesan <span style="color: red">*</span></label>
				<div class="col-sm-9">
					<textarea class="form-control form-control-sm rounded-0 border border-secondary" id="comment_content" name="comment_content" rows="4"></textarea>
				</div>
			</div>
			<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
				<div class="form-group row mb-2">
					<label class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
					</div>
				</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<div class="form-group row mb-0">
				<div class="offset-sm-3 col-sm-9">
					<button type="button" onclick="send_message(); return false;" class="btn action-button rounded-0"><i class="fa fa-send"></i> Submit</button>
				</div>
			</div>
		</div>
	</div>
</div>
<?php $this->load->view('themes/sky_light/sidebar')?>
