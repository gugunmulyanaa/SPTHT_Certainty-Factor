<section id="kontak" class="call-to-action-area section-gap " style="background-image: -webkit-linear-gradient(0deg, #ffffff 0%, #ffffff 100%) !important;">
	<div class="container">
		<?php echo form_open() ?>
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-60 col-lg-6">
				<div class="title text-center">
					<h2 style="margin-bottom: 0px;">Diagnosa</h2><br>
					<p>Halaman ini adalah halaman diagnosa, Silahkan memilih gejala dengan cara mencentang beberapa pilihan dibawah ini sesuai dengan gejala yang anda lihat...</p>
				</div>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 col-md-offset-2">
				<?php foreach ($listKelompok->result() as $value) { ?>
					<span style="font-weight: bold;"><?php echo $value->nama ?></span><br>
					<?php
					$this->load->model(array('Gejala_model'));
					$listGejala = $this->Gejala_model->get_by_kelompok($value->id);
					foreach ($listGejala->result() as $value2) { ?>
						<div class="row mb-3">
							<div class="col-xl-9 col-md-9 col-sm-6 col-xs-12">
								<?php echo $value2->kode . " - " . $value2->nama_gejala ?>
							</div>
							<div class="col-xl-3 col-md-3 col-sm-6 col-xs-12">
								<select name="gejala[]" id="" class="form-control">
									<option value="<?php echo $value2->id . "_0.0" ?>">Tidak</option>
									<option value="<?php echo $value2->id . "_0.2" ?>">Ragu Ragu</option>
									<option value="<?php echo $value2->id . "_0.4" ?>">Mungkin</option>
									<option value="<?php echo $value2->id . "_0.6" ?>">Sangat Mungkin</option>
									<option value="<?php echo $value2->id . "_0.8" ?>">Hampir Pasti</option>
									<option value="<?php echo $value2->id . "_1.0" ?>">Pasti</option>
								</select>
							</div>
						</div>
					<?php } ?>
				<?php } ?>
			</div>
		</div>
		<br>
		<div class="row d-flex justify-content-center">
			<div class="col-md-12" style="float: left; padding: 0;">
				<button type="submit" name="submit" class="btn main-btn" style="background-color: #41C1FF;  border-radius: 0px;">Proses</button>
			</div>
		</div>
	</div>
	<?php echo form_close() ?>
</section>