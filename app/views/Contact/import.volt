
   <head>
      <style>
      .table tbody tr th
      {
        min-width: 200px;
      }

      .table tbody tr td
      {
        min-width: 200px;
      }

      </style>
   </head>
   <body>
    <div class="container">
     <br />
     <br />
      <h1 align="center">Mapping</h1>
      <br />
        <div id="message"></div>
      <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Select CSV File</h3>
          </div>
          <div class="panel-body">
            <div class="row" id="upload_area">
              <form method="post" id="upload_form" enctype="multipart/form-data">
                <div class="col-md-6" align="right">Select File</div>
                <div class="col-md-6">
                  <input type="file" name="file" id="csv_file" />
                </div>
                <br /><br /><br />
                <div class="col-md-12" align="center">
                  <input type="submit" name="upload_file" id="upload_file" class="btn btn-primary" value="Upload" />
                </div>
              </form>
	
            </div>
            <div class="table-responsive" id="process_area">

            </div>
          </div>
        </div>
     </div>
     
   </body>

<script>
$(document).ready(function(){

  $('#upload_form').on('submit', function(event){

    event.preventDefault();
    $.ajax({
      url:"/contact/mapping",
      method:"POST",
      data:new FormData(this),
      dataType:'json',
      contentType:false,
      cache:false,
      processData:false,
	  success: function(data)
      {
        if(data.error != '')
        {
          $('#message').html('<div class="alert alert-danger">'+data.error+'</div>');
        }
        else
        {
          $('#process_area').html(data.output);
          $('#upload_area').css('display', 'none');
        }
      }
    });

  });

  var total_selection = 0;

  var first_name = 0;

  var last_name = 0;

  var email = 0;

  var column_data = [];

  $(document).on('change', '.set_column_data', function(){

    var column_name = $(this).val();

    var column_number = $(this).data('column_number');

    if(column_name in column_data)
    {
      alert('You have already define '+column_name+ ' column');

      $(this).val('');

      return false;
    }

    if(column_name != '')
    {
      column_data[column_name] = column_number;
    }
    else
    {
      const entries = Object.entries(column_data);

      for(const [key, value] of entries)
      {
        if(value == column_number)
        {
          delete column_data[key];
        }
      }
    }

    total_selection = Object.keys(column_data).length;

    if(total_selection == 3)
    {
      $('#import').attr('disabled', false);

      first_name = column_data.first_name;

      last_name = column_data.last_name;

      email = column_data.email;
    }
    else
    {
      $('#import').attr('disabled', 'disabled');
    }

  });

  $(document).on('click', '#import', function(event){

    event.preventDefault();

    $.ajax({
      url:"/contact/importData",
      method:"POST",
      data:{first_name:first_name, last_name:last_name, email:email},
      beforeSend:function(){
        $('#import').attr('disabled', 'disabled');
        $('#import').text('Importing...');
      },
      success:function(data)
      {
        $('#import').attr('disabled', false);
        $('#import').text('Import');
        $('#process_area').css('display', 'none');
        $('#upload_area').css('display', 'block');
        $('#upload_form')[0].reset();
        $('#message').html("<div class='alert alert-success'>"+data+"</div>");
      }
    })

  });
  
});
</script>

<!-- <body>
	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="row m-t-lg">
			<div class="col">

				<div class="ibox">
					<div class="ibox-content">
						<div class="text-center">
							<hr/>
							<p>
								<strong>Need help?</strong>
							</p>
							<a id="dlExam">Download Example File</a>
							<hr/>
							<form>
								<div id="myDropzone" class="dropzone fallback"></div>
								<!-- <input id="fileCsv" name="file" type="file" multiple/>
							</form>

						</div><hr/>
						<button id="importFile" class="btn btn-primary">Next</button>
						<button id="mapp" class="btn btn-primary">Map</button> -->
						<!-- <div id="wizard">
											<h1>Choose your file</h1>
											<div class="step-content">
												
											</div>
						
											<h1>Map your columns</h1>
											<div class="step-content">
												<div class="row">
													<div class="col-lg-12">
														<div class="ibox ">
															<div class="ibox-content">
																<div class="table-responsive">
																	<table class="table table-hover">
																		<thead>
																			<tr>
																				<th>File Columns</th>
																				<th>Fields</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td>Tanggal</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Nama</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Kontak</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Produk</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Wilayah</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Tipe Kontak</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>No. Telp</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>Email</td>
																				<td>
																					<select class="form-control" name="select">
																						<option>Tanggal dibuat</option>
																						<option>Nama</option>
																						<option>Kontak</option>
																						<option>Produk</option>
																						<option>Wilayah</option>
																						<option>Tipe Kontak</option>
																						<option>No. Telp</option>
																						<option>Email</option>
																					</select>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
						
															</div>
														</div>
													</div>
						
												</div>
											</div>
						
											<h1>Preview</h1>
											<div class="step-content">
												<div class="text-center m-t-md">
													<div class="ibox">
														<div class="ibox-content">
															<div class="table-responsive">
																<table id="dataTables" class="table table-bordered table-hover dataTables">
																	<thead>
																		<tr>
																			<th>No.</th>
																			<th>Tanggal Dibuat</th>
																			<th>Nama</th>
																			<th>Kontak</th>
																			<th>Produk</th>
																			<th>Wilayah</th>
																			<th>Tipe Kontak</th>
																			<th>No. Telp</th>
																			<th>Email</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td>1</td>
																			<td class="editable">20-09-2023</td>
																			<td class="editable">Rio</td>
																			<td class="editable">Y</td>
																			<td class="editable">Estate</td>
																			<td class="editable">Depok</td>
																			<td class="editable">Telp</td>
																			<td class="editable">092877354758</td>
																			<td class="editable">-</td>
																		</tr>
																		<tr>
																			<td>2</td>
																			<td class="editable">20-09-2023</td>
																			<td class="editable">Radit</td>
																			<td class="editable">Y</td>
																			<td class="editable">Estate</td>
																			<td class="editable">Bogor</td>
																			<td class="editable">Telp</td>
																			<td class="editable">093677844367</td>
																			<td class="editable">radit@gmail.com</td>
																		</tr>
																		<tr>
																			<td>3</td>
																			<td>20-09-2023</td>
																			<td>Adit</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>4</td>
																			<td>20-09-2023</td>
																			<td>Dilla</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>5</td>
																			<td>20-09-2023</td>
																			<td>Tya</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>6</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>7</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>8</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>9</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>10</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>11</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>12</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>13</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>14</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>15</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>16</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>17</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>18</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>19</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>20</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>21</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																		<tr>
																			<td>22</td>
																			<td>20-09-2023</td>
																			<td>Rio</td>
																			<td>Y</td>
																			<td>Estate</td>
																			<td>Depok</td>
																			<td>Telp</td>
																			<td>092877354758</td>
																			<td>-</td>
																		</tr>
																	</tbody>
																	<tfoot>
																		<tr>
																			<th>ID</th>
																			<th>Tanggal Dibuat</th>
																			<th>Nama</th>
																			<th>Kontak</th>
																			<th>Produk</th>
																			<th>Wilayah</th>
																			<th>Tipe Kontak</th>
																			<th>No. Telp</th>
																			<th>Email</th>
																		</tr>
																	</tfoot>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body> -->

<script>

	// Dropzone.autoDiscover = false;
	
	// $(document).ready(function () {
	
	// $("#wizard").steps();
	
	// if ($('#myDropzone').length) {
	//   $("div#myDropzone").dropzone({ 
	// 	url: "/contact/mapping",
	// 	paramName: "file",
	// 	maxFilesize: 10,
	// 	addRemoveLinks: true,
	// 	dictDefaultMessage: "<strong>Upload your file here.</strong></br> (You can click this box or just drag your file here)",
	//   });
	// }
	
	// var newDropZone = new Dropzone("#myDropzone", {
	// url: "",
	// paramName: "file", // The name that will be used to transfer the file
	// maxFilesize: 2, // MB
	// addRemoveLinks: true,
	// dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br> (This is just a demo dropzone. Selected files are not actually uploaded.)"
	// });
	
	// });
</script>