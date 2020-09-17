<div class="col-lg-12 col-md-12 col-sm-12 ">
	<h5 class="page-title mb-3"><?=strtoupper($page_title)?></h5>
	<div class="card rounded-0 border border-secondary mb-3">
		<div class="card-body">
			<div class="row">
				<table>
					<thead>
						<tr>
							<th><center>No.</center></th>
							<th width="500" style="border: 1px;"><center>Nama Lengkap</center></th>
							<th width="400"><center>Nama Sekolah</center></th>
							<th width="200"><center>Tahun Ajaran</center></th>
						</tr>
					</thead>
					<?php 
					$no = 1;
					$query = $this->db->select("*")->from("tracerstudy_junior")->get()->result_array();
					foreach ($query as $row) {
					$year = $this->db->get_where('academic_years', array('id' => $row['academic_year']))->row();
							?>
					<tbody>
						<tr>
							<td><center><?= $no++ ?></center></td>	
							<td><center><?= $row["nama"] ?></center></td>
							<td><center><?= $row["sekolah"] ?></center></td>
							<td><center><?= $year->academic_year ?></center></td>
						</tr>
					</tbody>
					<?php } ?>
				</table>
			</div>
		</div>
	</div>
</div>
