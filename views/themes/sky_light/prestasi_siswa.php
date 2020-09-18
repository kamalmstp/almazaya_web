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
	<?php foreach ($data as $dt) { ?>
		<div class="col-lg-5 card rounded-4 border border-secondary mb-3">
			<img src="<?=base_url('media_library/prestasi/'.$dt["image"]);?>" class="card-img-top rounded-0">
			<div class="card-body">
				<h5 class="card-title text-center text-uppercase"><?=$dt["title"]?></h5>
				<!-- <p class="card-text text-center mt-0 text-muted">Kelas : <?=$dt["class"]?></p> -->
				<p class="card-text text-justify"><?=$dt["content"]?></p>
			</div>
		</div>
	<?php } ?>
</div>
