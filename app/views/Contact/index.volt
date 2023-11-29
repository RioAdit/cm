<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

		<link rel="shortcut icon" href="#"/>

		<title>Contact Management</title>

		{{ stylesheet_link('summernote-0.8.18-dist/summernote-bs4.min.css') }}
		{{ stylesheet_link('css/bootstrap.min.css') }}
		{{ stylesheet_link('font-awesome/css/font-awesome.css') }}
		{{ stylesheet_link('css/animate.css') }}
		{{ stylesheet_link('css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css') }}
		{{ stylesheet_link('css/plugins/jqGrid/ui.jqgrid.css') }}
		{{ stylesheet_link('css/trirand/ui.jqgrid-bootstrap.css') }}

		{{ stylesheet_link('css/plugins/iCheck/custom.css') }}

		{{ stylesheet_link('css/plugins/dataTables/datatables.min.css') }}

		{{ stylesheet_link('css/plugins/clockpicker/clockpicker.css') }}
		
		{{ stylesheet_link('css/plugins/dropzone/basic.css') }}
		{{ stylesheet_link('css/plugins/dropzone/dropzone.css') }}
		{{ stylesheet_link('css/plugins/datapicker/datepicker3.css') }}

		{{ stylesheet_link('css/plugins/steps/jquery.steps.css') }}
		{{ stylesheet_link('css/plugins/jasny/jasny-bootstrap.min.css') }}
		{{ stylesheet_link('css/plugins/codemirror/codemirror.css') }}

		{{ stylesheet_link('css/style.css') }}
		{{ stylesheet_link('css/styling.css') }}

		<!-- Toastr style -->
		{{ stylesheet_link('css/plugins/toastr/toastr.min.css') }}
		
		{{ javascript_include('js/jquery-3.7.0.min.js') }}
		
		{{ javascript_include('js/popper.min.js') }}
		
		<!-- jquery UI -->
		{{ javascript_include('js/plugins/jquery-ui/jquery-ui.min.js') }}

		{{ javascript_include('js/bootstrap.min.js') }}
		
		{{ javascript_include('js/inspinia.js') }}

		{{ javascript_include('js/script.js') }}

		<style>
			/* Additional style to fix warning dialog position */
			#alertmod_table_list_2 {
				top: 900px !important;
			}
		</style>

		<script type="text/javascript">

			$(document).ready(function () {
show();
});
		</script>

	</head>

	<body>

		<div id="wrapper">
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav metismenu" id="side-menu">
						<li class="nav-header">
							<div class="dropdown profile-element">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<span class="block m-t-xs font-bold">Example user</span>
									<span class="text-muted text-xs block">menu
										<b class="caret"></b>
									</span>
								</a>
								<ul class="dropdown-menu animated fadeInRight m-t-xs">
									<li>
										<a class="dropdown-item" href="login.html">Logout</a>
									</li>
								</ul>
							</div>
							<div class="logo-element">IN+</div>
						</li>
						<li id="liDash" class="active">
							<a id="lDash" href="">
								<i class="fa fa-th-large"></i>
								<span class="nav-label">Dashboard</span>
							</a>
						</li>
						<li id="liList">
							<a id="lList" href="">
								<i class="fa fa-table"></i>
								<span class="nav-label">List Contact</span>
							</a>
						</li>
						<!-- 
						<li id="liProf">
							<a id="lProf" href="">
								<i class="fa fa-th-large"></i>
								<span class="nav-label">Profile</span>
							</a>
						</li>
						<li id="liImp">
							<a id="lImp" href="">
								<i class="fa fa-th-large"></i>
								<span class="nav-label">Import</span>
							</a>
						</li> -->
					</ul>
				</div>
			</nav>
			<div id="page-wrapper" class="gray-bg">
				<div id="nav-atas" class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
						<div class="navbar-header">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="#">
								<i class="fa fa-bars"></i>
							</a>
							<!--
																												<form role="search" class="navbar-form-custom" action="search_results.html">
																													<div class="form-group">
																														<input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search"/>
																													</div>
																												</form> -->
						</div>
						<!--
							<ul class="nav navbar-top-links navbar-right">
																									<li>
																										<span class="m-r-sm text-muted welcome-message">Welcome</span>
																									</li>
																									<li class="dropdown">
																										<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
																											<i class="fa fa-envelope"></i>
																											<span class="label label-warning">16</span>
																										</a>
																										<ul class="dropdown-menu dropdown-messages">
																											<li>
																												<div class="dropdown-messages-box">
																													<a class="dropdown-item float-left" href="profile.html">
																														<img alt="image" class="rounded-circle" src="img/a7.jpg"/>
																													</a>
																													<div class="media-body">
																														<small class="float-right">46h ago</small>
																														<strong>Mike Loreipsum</strong>
																														started following
																														<strong>Monica Smith</strong>.
																														<br/>
																														<small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
																													</div>
																												</div>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<div class="dropdown-messages-box">
																													<a class="dropdown-item float-left" href="profile.html">
																														<img alt="image" class="rounded-circle" src="img/a4.jpg"/>
																													</a>
																													<div class="media-body">
																														<small class="float-right text-navy">5h ago</small>
																														<strong>Chris Johnatan Overtunk</strong>
																														started following
																														<strong>Monica Smith</strong>.
																														<br/>
																														<small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
																													</div>
																												</div>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<div class="dropdown-messages-box">
																													<a class="dropdown-item float-left" href="profile.html">
																														<img alt="image" class="rounded-circle" src="img/profile.jpg"/>
																													</a>
																													<div class="media-body">
																														<small class="float-right">23h ago</small>
																														<strong>Monica Smith</strong>
																														love
																														<strong>Kim Smith</strong>.
																														<br/>
																														<small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
																													</div>
																												</div>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<div class="text-center link-block">
																													<a href="mailbox.html" class="dropdown-item">
																														<i class="fa fa-envelope"></i>
																														<strong>Read All Messages</strong>
																													</a>
																												</div>
																											</li>
																										</ul>
																									</li>
																									<li class="dropdown">
																										<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
																											<i class="fa fa-bell"></i>
																											<span class="label label-primary">8</span>
																										</a>
																										<ul class="dropdown-menu dropdown-alerts">
																											<li>
																												<a href="mailbox.html" class="dropdown-item">
																													<div>
																														<i class="fa fa-envelope fa-fw"></i>
																														You have 16 messages
																														<span class="float-right text-muted small">4 minutes ago</span>
																													</div>
																												</a>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<a href="profile.html" class="dropdown-item">
																													<div>
																														<i class="fa fa-twitter fa-fw"></i>
																														3 New Followers
																														<span class="float-right text-muted small">12 minutes ago</span>
																													</div>
																												</a>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<a href="grid_options.html" class="dropdown-item">
																													<div>
																														<i class="fa fa-upload fa-fw"></i>
																														Server Rebooted
																														<span class="float-right text-muted small">4 minutes ago</span>
																													</div>
																												</a>
																											</li>
																											<li class="dropdown-divider"></li>
																											<li>
																												<div class="text-center link-block">
																													<a href="notifications.html" class="dropdown-item">
																														<strong>See All Alerts</strong>
																														<i class="fa fa-angle-right"></i>
																													</a>
																												</div>
																											</li>
																										</ul>
																									</li>
																		
																									<li>
																										<a href="login.html">
																											<i class="fa fa-sign-out"></i>
																											Log out
																										</a>
																									</li>
																								</ul> -->
					</nav>
				</div>

				<div class="wrapper wrapper-content animated fadeInRight">

					<div id="alert" class="" tabindex="-1"></div>

					<div id="tampil"></div>

				</div>
			</div>
		</div>

		<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<h4 class="modal-title" id="judul">Input Data Kontak</h4>
					</div>
					<div class="modal-body">
						<div class="full-heigt-scroll">
							<form id="ae-data">
								<div class="row">
									<input id="idkon" name="idkon" type="hidden"/>
									<!-- 0<div class="col-md">
										<div class="form-group" id="data_1">
											<label class="font-normal">Tanggal</label>
											<div class="input-group date">
												<input id="tgl_dibuat" name="tgl_dibuat" type="date" class="form-control" value=""/>
											</div>
										</div>
									</div> -->
									<div class="col-md">
										<div class="form-group">
											<label>Name</label>
											<input id="nama" name="nama" type="text" class="form-control" placeholder="Nama"/>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Product</label>
											<select name="produk" class="sProd form-control form-control-user" placeholder="--- Pilih Produk ---">
												<option value="none" selected disabled hidden></option>
												{% for p in produk %}
													<option value="{{p.idprod}}">{{p.nama_prod}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									

									<div class="col-md">
										<div class="form-group">
											<label>Region</label>
											<select name="wilayah" class="sWila form-control form-control-user" placeholder="--- Pilih Wilayah ---">
												<option value="none" selected disabled hidden></option>
												{% for w in wilayah %}
													<option value="{{w.idwilayah}}">{{w.nama_prov}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Contact Type</label>
											<select name="tipe_kon" class="sTipe form-control form-control-user" placeholder="--- Pilih Tipe Kontak ---">
												<option value="none" selected disabled hidden></option>
												{% for t in tipe %}
													<option value="{{t.idtipe}}">{{t.tipe}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									
									<div class="col-md">
										<div class="form-group">
											<label>Phone Number</label>
											<input id="no_telp" name="no_telp" type="text" class="form-control" placeholder="No. Telp"/>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Email</label>
											<input id="email" name="email" type="email" class="form-control" placeholder="E-mail"/>
										</div>
									</div>
								</div>
								<div class="row">
									
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="toAdd()" class="btn btn-white" data-dismiss="modal">
							Cancel
						</button>
						<button type="button" id="add" class="btnsave btn btn-primary">
							Add
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal inmodal" id="modalEditProf" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<h4 class="modal-title" id="judul">Input Data Kontak</h4>
					</div>
					<div class="modal-body">
						<div class="full-heigt-scroll">
							<form id="ae-data">

								<div class="row">
									<input id="idkon" name="idkon" type="hidden"/>
									<div class="col-md">
										<div class="form-group">
											<label>Nama</label>
											<input id="nama" name="nama" type="text" class="form-control" placeholder="Nama"/>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Produk</label>
											<select name="produk" class="sProd form-control form-control-user">
												<option value="none" selected disabled hidden>--- Pilih Produk ---</option>
												{% for p in produk %}
													<option value="{{p.idprod}}">{{p.nama_prod}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md">
										<div class="form-group">
											<label>Wilayah</label>
											<select name="wilayah" class="sWila form-control form-control-user">
												<option value="none" selected disabled hidden>--- Pilih Wilayah ---</option>
												{% for w in wilayah %}
													<option value="{{w.idwilayah}}">{{w.nama_prov}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Tipe Kontak</label>
											<select name="tipe_kon" class="sTipe form-control form-control-user">
												<option value="none" selected disabled hidden>--- Pilih Tipe Kontak ---</option>
												{% for t in tipe %}
													<option value="{{t.idtipe}}">{{t.tipe}}</option>
												{% endfor %}
											</select>
										</div>
									</div>
								</div>
								
								<div class="row">
									
									<div class="col-md">
										<div class="form-group">
											<label>No. Telp</label>
											<input id="no_telp" name="no_telp" type="text" class="form-control" placeholder="No. Telp"/>
										</div>
									</div>
									
									<div class="col-md">
										<div class="form-group">
											<label>Email</label>
											<input id="email" name="email" type="email" class="form-control" placeholder="E-mail"/>
										</div>
									</div>
								</div>
								<div class="row">
									
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="toAdd()" class="btn btn-white" data-dismiss="modal">
							Cancel
						</button>
						<button type="button" id="add" class="btnsave btn btn-primary">
							Add
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<h4 class="modal-title">Export Data Kontak</h4>
					</div>
					<div class="modal-body">
						<h5>Export semua data kontak dalam format :</h5>
						<div class="hr-line-dashed"></div>
						<div class="row">
							<div class="col-sm-6">
								<div class="i-checks">
									<label>
										<input type="radio" value="option1" name="a"/>
										<i></i>
										CSV
									</label>
								</div>
								<div class="i-checks">
									<label>
										<input type="radio" value="option2" name="a"/>
										<i></i>
										XLS
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="btntutupmodal" class="btn btn-secondary" data-dismiss="modal">
							Cancel
						</button>
						<button type="button" id="btnsimpanmodal" class="btn btn-primary">
							Export
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal modal-transparent fade" id="deleteModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Caution !</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="iddel" name="iddel">
						<p>Are you sure you want to delete this data?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
						<button type="button" onclick="deleteContact()" class="btn btn-primary">Yes</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal modal-transparent fade" id="sendMail" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Caution !</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p>Do you want to send this mail?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
						<button id="btnSendMail"  type="button" class="btn btn-primary">Yes</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal inmodal" id="modalProfile" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
						<h4 class="modal-title" id="judul">Input Data Kontak</h4>
					</div>
					<div class="modal-body">
						<div class="ibox">
					<div class="ibox-content">
						<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">
							Action
						</button>
						<ul class="dropdown-menu">
							<li>
								<a href="#" class="dropdown-item">Edit</a>
							</li>
							<li>
								<a href="#" class="dropdown-item">Hapus</a>
							</li>
						</ul>
						<hr/>
						<div class="row m-b-lg m-t-lg">
							<div class="col-md-3">
								<div class="profile-image">
									<img src="img/a4.jpg" class="rounded-circle circle-border m-b-md" alt="profile"/>
								</div>
								<div class="profile-info">
									<div class="">
										<input id="nama" name="nama" type="text" readonly class="form-control-plaintext"/>
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
							<h5>Detail Kontak</h5>
							<div class="ibox-tools">
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
								</a>
								<a class="dropdown-toggle" data-toggle="dropdown" href="#"></a>
								<a class="close-link">
									<i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content">
							<form>
								<input id="idkon" name="idkon" type="hidden"/>
								<div class="form-group" id="data_1">
									<label class="font-normal">Tanggal</label>
									<div class="input-group date">
										<input id="tgl_dibuat" name="tgl_dibuat" type="text" readonly class="form-control-plaintext"/>
									</div>
								</div>
								<div class="form-group">
									<label>Produk</label>
									<input id="produk" name="produk" type="text" readonly class="form-control-plaintext"/>
								</div>
								<div class="form-group">
									<label>Wilayah</label>
									<input id="wilayah" name="wilayah" type="text" readonly class="form-control-plaintext"/>
								</div>
								<div class="form-group">
									<label>Tipe Kontak</label>
									<input id="tipe_kon" name="tipe_kon" type="text" readonly class="form-control-plaintext"/>
								</div>
								<div class="form-group">
									<label>No. Telp</label>
									<input id="no_telp" name="no_telp" type="text" readonly class="form-control-plaintext"/>
								</div>
								<div class="form-group">
									<label>Email</label>
									<input id="email" name="email" type="email" readonly class="form-control-plaintext"/>
								</div>
							</form>
						</div>
					</div>
				</div>
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>

		<div class="overlay"></div>

		

		<!-- Mainly scripts -->

		{{ javascript_include('js/plugins/metisMenu/jquery.metisMenu.js') }}

		<!-- jqGrid -->
		{{ javascript_include('js/plugins/jqGrid/i18n/grid.locale-en.js') }}
		{{ javascript_include('js/plugins/jqGrid/jquery.jqGrid.min.js') }}

		<!-- Custom and plugin javascript -->
		
		{{ javascript_include('js/plugins/pace/pace.min.js') }}

		<!-- Clock picker -->
    	{{ javascript_include('js/plugins/clockpicker/clockpicker.js') }}

		<!-- Touch Punch - Touch Event Support for jQuery UI -->
		{{ javascript_include('js/plugins/touchpunch/jquery.ui.touch-punch.min.js') }}

		<!-- iCheck -->
		{{ javascript_include('js/plugins/iCheck/icheck.min.js') }}

		{{ javascript_include('js/plugins/slimscroll/jquery.slimscroll.min.js') }}

		{{ javascript_include('js/plugins/dataTables/datatables.min.js') }}
		{{ javascript_include('js/plugins/dataTables/dataTables.bootstrap4.min.js') }}

		{{ javascript_include('https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js') }}
		{{ javascript_include('https://cdn.datatables.net/buttons/1.4.2/js/buttons.colVis.min.js') }}

		<!-- Sparkline -->
		{{ javascript_include('js/plugins/sparkline/jquery.sparkline.min.js') }}

		<!-- Data picker -->
		{{ javascript_include('js/plugins/datapicker/bootstrap-datepicker.js') }}

		<!-- SUMMERNOTE -->
		{{ javascript_include('summernote-0.8.18-dist/summernote-bs4.min.js') }}

		<!-- DROPZONE -->
		{{ javascript_include('js/plugins/dropzone/dropzone.js') }}

		<!-- Jasny -->
		{{ javascript_include('js/plugins/jasny/jasny-bootstrap.min.js') }}

		<!-- CodeMirror -->
		{{ javascript_include('js/plugins/codemirror/codemirror.js') }}
		{{ javascript_include('js/plugins/codemirror/mode/xml/xml.js') }}

		<!-- Steps -->
		{{ javascript_include('js/plugins/steps/jquery.steps.min.js') }}

		<!-- Jquery Validate -->
		{{ javascript_include('js/plugins/validate/jquery.validate.min.js') }}

	</body>
</html>
