<head>

	<style>
		th,
		td {
			white-space: nowrap;
		}
		div.dataTables_wrapper {
			width: 1200px;
			margin: 0 auto;
		}

		.dataTables_paginate {
			float: right;
		}
	</style>

</head>

<body>

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>Data Contact</h5>
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
					<div class="ibox-content">
						<div class="col-sm-5 m-b-xs">
							<div class="input-group-prepend">
								<button class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal2">
									Add
								</button><button id="alistImp" class="btn btn-lg btn-light">Import</button>
								<!-- <button data-toggle="dropdown" class="btn btn-white dropdown-toggle float-right" type="button">
									Action
								</button>
								<ul class="dropdown-menu">
									<li id="listImp">
										
									</li>
									<li>
										<a href="#" data-toggle="modal" data-target="#myModal3">Export</a>
									</li>
								</ul> -->
							</div>
						</div>

						<hr>

						<div class="table-responsive">
							<table id="dataTs" class="display table table-striped table-bordered table-hover order-column" style="width: 100%;">
								<thead>
									<tr>
										<th>No.</th>
										<th>Create Date</th>
										<th>Name</th>
										<th>Product</th>
										<th>Region</th>
										<th>Contact Type</th>
										<th>Phone Number</th>
										<th>Email</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
								<?php $a = 1; ?>
									{% for c in contact %}
									<input id="idkon" name="idkon" type="hidden"/>
										<tr>
											<th scope="row"><?= $a++; ?></th>
											<td>{{c.tgl_dibuat}}</td>
											<td id="profileId" class="toProfile" data-idkon="{{c.idkon}}">{{c.nama}}</td>
											<td>{{c.produk}}</td>
											<td>{{c.wilayah}}</td>
											<td>{{c.tipe_kon}}</td>
											<td>{{c.no_telp}}</td>
											<td>{{c.email}}</td>
											<td>
												<a href='#myModal2' onclick="toEdit()" class='btn btn-info btn-small' id='editId' data-toggle='modal' data-idkon="{{c.idkon}}">Edit</a>
												<a href='#deleteModal' class='btn btn-danger btn-small' id='deleteId' data-toggle='modal' data-idkon="{{c.idkon}}">Delete</a>
											</td>
										</tr>
									{% endfor %}
								</tbody>
								<tfoot></tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body></div></div><script>$(document).ready(function () {
$('#dataTs').DataTable({
	dom: 'Bfrtip',
	buttons: [
		'pageLength',
		{
			extend: 'csv',
			exportOptions: {
				columns: ':visible'
			}
		},
		'colvis'
	],
	lengthMenu: [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, 'All']
    ],
	// columnDefs: [ {
	// 	targets: -1,
	// 	visible: false
	// } ],
});
});</script></body>
