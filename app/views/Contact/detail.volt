<div class="ibox">
	<div class="ibox-title">
		<h5>Contact Details</h5>
		<!-- <div class="ibox-tools">
										<a class="collapse-link">
											<i class="fa fa-chevron-up"></i>
										</a>
										<a class="dropdown-toggle" data-toggle="dropdown" href="#"></a>
										<a class="close-link">
											<i class="fa fa-times"></i>
										</a>
									</div> -->
	</div>
	<div class="ibox-content">
		<form id="formDetail">
			<input id="idkon" name="idkon" type="hidden"/>
			<div class="form-group" id="">
				<label class="font-weight-bold">Create date</label>
				<div class="input-group date">
					<input id="tgl_dibuat" name="tgl_dibuat" type="text" readonly disabled class="form-control-plaintext"/>
				</div>
			</div>
			<div class="form-group">
				<label class="font-weight-bold">Product</label>
				<select name="produk" class="psProd form-control-plaintext dropdown-toggle" readonly disabled>
					<option value="none" selected disabled hidden></option>
					{% for p in produk %}
						<option value="{{p.idprod}}">{{p.nama_prod}}</option>
					{% endfor %}
				</select>
			</div>
			<div class="form-group">
				<label class="font-weight-bold">Region</label>
				<select name="wilayah" class="psWila form-control-plaintext" readonly disabled>
					<option value="none" selected disabled hidden></option>
					{% for w in wilayah %}
						<option value="{{w.idwilayah}}">{{w.nama_prov}}</option>
					{% endfor %}
				</select>
			</div>
			<div class="form-group">
				<label class="font-weight-bold">Contact Type</label>
				<select name="tipe_kon" class="psTipe form-control-plaintext" readonly disabled>
					<option value="none" selected disabled hidden></option>
					{% for t in tipe %}
						<option value="{{t.idtipe}}">{{t.tipe}}</option>
					{% endfor %}
				</select>
			</div>
			<div class="form-group">
				<label class="font-weight-bold">Phone Number</label>
				<input id="no_telp" name="no_telp" type="text" readonly disabled class="form-control-plaintext"/>
			</div>
			<div class="form-group">
				<label class="font-weight-bold">Email</label>
				<input id="email" name="email" type="email" readonly disabled class="form-control-plaintext"/>
			</div>
		</form>
	</div>
</div>
