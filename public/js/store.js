
function doSave() {
    var nama=document.getElementById("nama");
    var no_ktp=document.getElementById("no_ktp");
    
        $.ajax({
            type: "POST",
            url:"/warga/insert",
            data:"nama="+nama.value+"&no_ktp="+no_ktp.value,
            success: function (response) {
                if(response==1) {
                    var alertSuccess='<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil disimpan!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
                    
                    // window.location = "/warga/view";
                    $('#dataBaruModal').modal('hide');

                    // $(".btnsimpan").click(function () {
                    //     $("#dataBaruModal").removeClass('fade').modal('hide');
                    //     $("#dataBaruModal").modal("dispose");
                    // })
                    
                    $('.alert').html(alertSuccess)
                }else{
                    alert("data gagal disimpan")
                }
            },
            error: function() {
                alert("data gagal disimpan");
            }
        });
}

var nama=document.getElementById("nama");
var no_ktp=document.getElementById("no_ktp");

$('.tambah').click(function(){
var aksi = 'Tambah Data Warga';
$.ajax({
    url: '{{ url('warga/insert') }}',
    method: 'post',
    data: {aksi:aksi},
    success:function(data){
        $('#myModal').modal("show");
        $('#tampil_modal').html(data);
        document.getElementById("judul").innerHTML='Tambah Data';

    }
});
});

$('.edit').click(function(){

    var id = $(this).attr("id");
    $.ajax({
        url: '{{ url('warga/edit') }}',
        method: 'post',
        data: {id:id},
        success:function(data){
            $('#myModal').modal("show");
            $('#tampil_modal').html(data);
            document.getElementById("judul").innerHTML='Edit Data';  
        }
    });
});

$('.hapus').click(function(){

    var id = $(this).attr("id");
    $.ajax({
        url: '{{ url('warga/delete') }}',
        method: 'post',
        data: {id:id},
        success:function(data){
            $('#myModal').modal("show");
            $('#tampil_modal').html(data);
            document.getElementById("judul").innerHTML='Hapus Data';
        }
    });
    });
