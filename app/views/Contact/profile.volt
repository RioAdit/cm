<body>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div
			class="row">

			<!-- 1 -->
			<div class="col-sm-3">
				<div class="ibox">
					<div class="ibox-content">
						<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">
							Action
						</button>
						<ul class="dropdown-menu">
							<li>
								<!-- <a id="editProf" class="dropdown-item">Edit</a> -->
								<a href='#modalEditProf' onclick="toEdit()" class='dropdown-item' id='editId' data-toggle='modal'>Edit</a>
							</li> 
							<!-- <li>
								<a href="#" class="dropdown-item" onClick="deleteContactProf()">Delete</a>
							</li> -->
							<li>
								<a href='#deleteModal' class='dropdown-item' id='deleteId' data-toggle='modal' data-idkon="{{c.idkon}}">Delete</a>
							</li>
						</ul>
						
						<div
							class="row ">
							<!--m-b-lg m-t-lg-->
							<div class="col-md-12">
								<div class="">
									<div class="form-group">
										<input id="namaM" name="nama" type="text" readonly disabled class="form-control-plaintext"/>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="ibox">
						<div class="ibox-content icons-box">
							<center>
								<div class="row">
									<div class="col-md-5">
										<div class="infont col-md-1 col-sm-1 float-right">
											<a href="#">
												<i class="fa fa-phone"></i>
											</a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="infont col-md-1 col-sm-1 float-right">
											<a href="#">
												<i class="fa fa-envelope"></i>
											</a>
										</div>
									</div>
								</div>
							</center>
						</div>
					</div>

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
									<input id="email" name="email" type="email" readonly disabled class="email form-control-plaintext"/>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- 2 -->
			<div class="col-sm-6">
				<div class="tabs-container">
					<ul class="nav nav-tabs" role="tablist">
						<li>
							<a class="nav-link active" data-toggle="tab" href="#tab-1">
								Note</a>
						</li>
						<li>
							<a class="nav-link" data-toggle="tab" href="#tab-2">Email</a>
						</li>
						<li>
							<a class="nav-link" data-toggle="tab" href="#tab-3">Activity</a>
						</li>
						<li>
							<a class="nav-link" data-toggle="tab" href="#tab-4">File</a>
						</li>
					</ul>


					<div
						class="tab-content">

						<!-- Note -->
						<div id="tab-1" class="tab-pane active">
							<div class="panel-body">
								<!-- <form id="formNote" method="post"> -->
									<div
										class="col-lg-12 animated fadeInRight">
										<!--<textarea id="note" name="note" class="summernote"></textarea>-->
										<input id="idkn" name="idkon" type="hidden"/>
										<div class="form-group">
											<input id="note" name="note" type="text" class="form-control" placeholder="Write note here.."/>
										</div>
										<button id="btnSaveNote" class="btn btn-lg btn-primary">
											Add Note
										</button>

									</div>
								</form>
							</div>
						</div>

						<!-- Mail -->
						<div id="tab-2" class="tab-pane">
							<div class="panel-body">
								<div class="col-lg-12 animated fadeInRight">
									<div class="mail-box-header">
										<div class="float-right tooltip-demo">
											<!-- <a class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder">
												<i class="fa fa-pencil"></i>
												Draft</a>
											<button id="discardMail" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email">
												<i class="fa fa-times"></i>
												Discard</button> -->
										</div>
										<h2>Mail</h2>
									</div>
									<div class="mail-box">
										<div class="mail-body">
											<form method="get">
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">To:</label>

													<div class="col-sm-10">
														<input id="emailTo" name="email" type="text" class="email form-control-plaintext" readonly disabled value=""/>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Subject:</label>

													<div class="col-sm-10">
														<input id="emailSub" name="emailSub" type="text" class="form-control" value=""/>
													</div>
												</div>
											</form>
										</div>

										<div class="mail-text h-200">
											<!-- <div id="emailSum" class="summernote"></div> -->
											<textarea rows=10 id="emailCon" class="form-control"></textarea>
											<div class="clearfix"></div>
										</div>
										<div class="mail-body text-right tooltip-demo">
											<button id="discardMail" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email">
												<i class="fa fa-times"></i>
												Discard</button>
											<a href='#sendMail' class='btn btn-sm btn-primary' data-toggle='modal'><i class="fa fa-paper-plane"></i> Send</a>
											<!-- <button id="sendMail" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send">
												
												Send</button> -->
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- Activity -->
						<div id="tab-3" class="tab-pane">
							<div class="panel-body">
								<div class="col-lg-12 animated fadeInRight">
									<!-- <form id="formAct"> -->
									<input id="idka" name="idkon" type="hidden"/>
										<div class="form-group">
											<label>Title</label>
											<input id="judul_act" name="judul_act" type="text" class="form-control" placeholder=""/>
										</div>

										<div class="row">

											<div class="col-md">
												<div class="form-group" id="data_1">
													<label class="font-normal">Date</label>
													<div class="input-group date">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span><input id="tgl_act" name="tgl_act" type="text" class="form-control" value=""/>
													</div>
												</div>
											</div>

											<div class="col-md">
												<div class="form-group">
													<label class="font-normal">Time</label>
													<div class="input-group clockpicker" data-autoclose="true">
														<input id="jam_act" name="jam_act" type="text" class="form-control" value="">
														<span class="input-group-addon">
															<span class="fa fa-clock-o"></span>
														</span>
													</div>
												</div>
											</div>
										</div>

										<div class="form-group">
											<label>Note</label>
											<textarea id="note_act" name="note_act" type="text" class="form-control" placeholder=""></textarea>
										</div>
										<button id="btnSaveAct" class="btn btn-lg btn-primary" type="submit">
											Add
										</button>
									</form>
								</div>
							</div>
						</div>

						<div id="tab-4" class="tab-pane">
							<div class="panel-body">
								<div class="col-lg-12 animated fadeInRight">
									<div class="step-content">
										<div class="text-center">
											<form action="#" class="dropzone" id="dropzoneForm">
												<div class="fallback">
													<input name="file" type="file" multiple/>
												</div>
											</form>
										</div>
										<hr>
										<button class="btn btn-lg btn-primary" type="submit">
											Add
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<hr/>

				<!-- Timeline -->
				<div class="ibox">
					<div class="ibox-title">
						<h5>Timeline</h5>
						<!-- <div class="ibox-tools">
							<a class="collapse-link">
								<i class="fa fa-chevron-up"></i>
							</a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<a href="#" class="dropdown-item">Config option 1</a>
								</li>
								<li>
									<a href="#" class="dropdown-item">Config option 2</a>
								</li>
							</ul>
							<a class="close-link">
								<i class="fa fa-times"></i>
							</a>
						</div> -->
					</div>

					<div class="ibox-content inspinia-timeline">
						<div class="timeline-item">
							<div class="row p-xs">
								{% for h in history %}
									<div id="waktul" class="col-3 date">
										{{h.waktu}} WIB
										<br/>
									</div>
									<div class="col-7 content no-top-border">
										<p class="">
											<strong>
												{{h.keterangan}}</strong>
										</p>
									</div>
								{% endfor %}
								<!-- <div class="col-4 date">
																									<input id="waktu" name="waktu" type="text" readonly class="form-control-plaintext"/>
																									<br/>
																								</div>
																								<div class="col-7 content no-top-border">
																									<p class="">
																										<strong>Contact 
																											<input id="ket" name="ket" type="text" readonly class="form-control-plaintext"/></strong>
																									</p>
																								</div> -->
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- 3 -->
			<div
				class="col-sm-3">
				<!-- <div class="ibox">
													<div class="ibox-title">
														<h4>Insights</h4>
														<div class="ibox-tools">
															<a class="collapse-link">
																<i class="fa fa-chevron-up"></i>
															</a>
															<a class="dropdown-toggle" data-toggle="dropdown" href="#">
																<i class="fa fa-wrench"></i>
															</a>
															<ul class="dropdown-menu dropdown-user">
																<li>
																	<a href="#" class="dropdown-item">Edit</a>
																</li>
																<li>
																	<a href="#" class="dropdown-item">Hapus</a>
																</li>
															</ul>
															<a class="close-link">
																<i class="fa fa-times"></i>
															</a>
														</div>
													</div>
													<div class="ibox-content">
														<div class="row">
															<strong>
																<label for="lastCom" class="col col-form-label">Last Communication</label>
															</strong>
															<div class="col">
																<input type="text" readonly class="form-control-plaintext" id="lastCom" value="-"/>
															</div>
														</div>
								
														<div class="row">
															<strong>
																<label for="lastComOn" class="col col-form-label">Last Communication On</label>
															</strong>
															<div class="col">
																<input type="text" readonly class="form-control-plaintext" id="lastComOn" value="-"/>
															</div>
														</div>
								
														<div class="row">
															<strong>
																<label for="openDeal" class="col col-form-label">Open Deals</label>
															</strong>
															<div class="col">
																<input type="text" readonly class="form-control-plaintext" id="openDeal" value="0 (Rp 0)"/>
															</div>
														</div>
								
														<div class="row">
															<strong>
																<label for="dealWon" class="col col-form-label">Deals Won</label>
															</strong>
															<div class="col">
																<input type="text" readonly class="form-control-plaintext" id="dealWon" value="0 (Rp 0)"/>
															</div>
														</div>
								
														<div class="row">
															<strong>
																<label for="act" class="col col-form-label">Activities</label>
															</strong>
															<div class="col">
																<input type="text" readonly class="form-control-plaintext" id="act" value="0/0"/>
															</div>
														</div>
													</div>
												</div> 
				-->
				
				<div id="tampilAct"></div>
				
				<div id="tampilNote"></div>

			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function () {
$(".summernote").summernote({
tabsize: 2,
height: 100,
minHeight: 100,
maxHeight: 400,
callbacks: {
onInit: function () {
$('.note-editing-area').attr('dir', 'auto');
}
}
});

if ($('.note-editor .note-toolbar').length) {
  var z_index = 900;
  $(".note-editor .note-toolbar").each(function(){
  $(this).css({'z-index': z_index});
  z_index--;
  });
}

$(".noToolbar").summernote({airMode: true});

var mem = $('#data_1 .input-group.date').datepicker({
todayBtn: "linked",
keyboardNavigation: false,
forceParse: false,
calendarWeeks: true,
autoclose: true,
format: "yyyy/mm/dd"
});

$('.clockpicker').clockpicker();

});


Dropzone.options.dropzoneForm = {
paramName: "file", // The name that will be used to transfer the file
maxFilesize: 2, // MB
dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br> (This is just a demo dropzone. Selected files are not actually uploaded.)"
};
</script></body>
