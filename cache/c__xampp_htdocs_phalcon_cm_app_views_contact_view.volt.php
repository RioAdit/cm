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

<div class="wrapper wrapper-content animated fadeInRight">
	<div id="viewIndex" class="row">

		<div class="col-lg-3">
			<div class="ibox">
				<div class="ibox-title">
					<span class="label label-primary float-right">Today</span>
					<h5>New Contacts
						<br>
						added today
					</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">9</h1>
					<small>New contacts</small>
				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="ibox">
				<div class="ibox-title">
					<span class="label label-info float-right">Weekly</span>
					<h5>New Contacts
						<br>
						added this week
					</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">18</h1>
					<small>New contacts</small>
				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="ibox">
				<div class="ibox-title">
					<span class="label label-success float-right">Monthly</span>
					<h5>New Contacts
						<br>
						added this month
					</h5>
				</div>

				<div class="ibox-content">
					<h1 class="no-margins">34</h1>
					<small>New contacts</small>
				</div>
			</div>
		</div>

		<div class="col-lg-3">
			<div class="ibox">
				<div class="ibox-title">
					<span class="label label-danger float-right">All Time</span>
					<h5>Total<br>Contacts
					</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">180</h1>
					<small>All time</small>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-3"></div>
		<div class="col-lg-3"></div>
		<div class="col-lg-3"></div>
	</div>

	

	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
				<div class="ibox-title">Most recently updated contact</div>
				<div class="ibox-content">
					<div class="table-responsive">
						<table id="dataTable" class="table table-bordered table-hover dataTable">
							<thead>
								<tr>
									<th>No.</th>
									<th>Name</th>
									<th>Product</th>
									<th>Region</th>
									<th>Contact Type</th>
									<th>Phone Number</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
								<?php $a = 1; ?>
								<?php foreach ($contact as $c) { ?>
									<tr>
										<th scope="row"><?= $a++; ?></th>
										<td><?= $c->nama ?></td>
										<td><?= $c->produk ?></td>
										<td><?= $c->wilayah ?></td>
										<td><?= $c->tipe_kon ?></td>
										<td><?= $c->no_telp ?></td>
										<td><?= $c->email ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12"></div>
</div>

<script>
	$(document).ready(function () {
$('#dataTable').DataTable();
});
</script>
