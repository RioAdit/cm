<?php

//upload.php

$error = '';

$html = '';

if($_FILES['file']['name'] != '')
{
 $file_array = explode(".", $_FILES['file']['name']);

 $extension = end($file_array);

 if($extension == 'csv')
 {
  $file_data = fopen($_FILES['file']['tmp_name'], 'r');

  $file_header = fgetcsv($file_data);

  $html .= '<table class="table table-bordered"><tr>';

  for($count = 0; $count < count($file_header); $count++)
  {
   $html .= '
   <th>
    <select name="set_column_data" class="form-control set_column_data" data-column_number="'.$count.'">
     <option value="">Set Count Data</option>
     <option value="first_name">First Name</option>
     <option value="last_name">Last Name</option>
     <option value="email">Email</option>
    </select>
   </th>
   ';
  }

  $html .= '</tr>';

  $limit = 0;

  while(($row = fgetcsv($file_data)) !== FALSE)
  {
   $limit++;

   if($limit < 6)
   {
    $html .= '<tr>';

    for($count = 0; $count < count($row); $count++)
    {
     $html .= '<td>'.$row[$count].'</td>';
    }

    $html .= '</tr>';
   }

   $temp_data[] = $row;
  }

  $_SESSION['file_data'] = $temp_data;

  $html .= '
  </table>
  <br />
  <div align="right">
   <button type="button" name="import" id="import" class="btn btn-success" disabled>Import</button>
  </div>
  <br />
  ';
 }
 else
 {
  $error = 'Only <b>.csv</b> file allowed';
 }
}
else
{
 $error = 'Please Select CSV File';
}

$output = array(
 'error'  => $error,
 'output' => $html
);

echo json_encode($output);


?>

<!-- <div class="ibox">
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

                    </tr>
                </tbody>
			</table>
		</div>
	</div>
</div>

<div id="container"></div> -->

<script>
// $.get('/files/example.csv', function(data) {

//     // start the table
//     var html = '<table">';

//     // split into lines
//     var rows = data.split("\n");

//     // parse lines
//     rows.forEach( function getvalues(ourrow) {

//     // start a table row
//     html += "<tr>";

//     // split line into columns
//     var columns = ourrow.split(",");

//     html += "<td>" + columns[0] + "</td>";
//     html += "<td>" + columns[1] + "</td>";
//     html += "<td>" + columns[2] + "</td>";

//     // close row
//     html += "</tr>";
//     })
//     // close table
//     html += "</table>";

//     // insert into div
//     $('#container').append(html);

//     });
</script>