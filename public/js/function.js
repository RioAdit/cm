$(document).ready(function () {
    $("#tambah-data").validate({
        rules: {
            nama: {
                required: true,
                minlength: 3
            },
            no_ktp: {
                required: true,
                number: true,
                minlength: 16,
                maxlength: 16
            }
        },
        messages: {
            nama: {
                required: "Tolong masukkan Nama",
                minlength: "Nama tidak boleh kurang dari 3 huruf"
            },
            no_ktp: {
                required: "Tolong masukkan Nomor KTP",
                number: "Nomor KTP hanya berisi angka",
                minlength: "Nomor KTP harus 16 digit",
                maxlength: "Nomor KTP harus 16 digit"
            }
        }
    });

    $('#dataBaruModal, #deleteModal').on('shown.bs.modal', function (e) {
        var id = $(e.relatedTarget).data('id');
        if (! id) {
            $('#id').val('');
            $('#iddel').val('');
            $('#nama').val('');
            $('#no_ktp').val('');
        } else {
            $.ajax({
                type: 'post',
                url: '/warga/get',
                data: 'id=' + id,
                success: function (res) {
                    var obj = JSON.parse(res);

                    $('#id').val(obj.id);
                    $('#iddel').val(obj.id);
                    $('#nama').val(obj.nama);
                    $('#no_ktp').val(obj.no_ktp);

                    // alert("1")
                }
            });
        }
    });

    $(document).on('click', "#add", function () {
        var nama = document.getElementById("nama");
        var no_ktp = document.getElementById("no_ktp");
        
        var isValid = $("#tambah-data").valid();

        if ($('#nama').val().trim() == '') {
            $('#nama').focus();
            return false;
        }

        if ($('#no_ktp').val().trim() == '') {
            $('#no_ktp').focus();
            return false;
        }

        if (isValid) {
            $.ajax({
                type: "POST",
                url: "/warga/save",
                data: "nama=" + nama.value + "&no_ktp=" + no_ktp.value,
                success: function (response) {
                    if (response == 1) {
                        var alertSuccess = '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil disimpan!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

                        $('#dataBaruModal').modal('hide');
                    
                        $('body').removeClass('modal-open');
                        $('.modal-backdrop').remove();
                        
                        $('#dataBaruModal form :input').val("");
                        setTimeout(function () {
                            $("[data-dismiss=modal]").trigger({ type: "click" });
                        }, 100)

                        $(".btnsave").attr('id', 'add');
                        
                        // $('#dataBaruModal').modal('hide');

                        // $(".btnsimpan").click(function () {
                        //     $("#dataBaruModal").removeClass('fade').modal('hide');
                        //     $("#dataBaruModal").modal("dispose");
                        // })

                        // window.location = "/warga/view";
                        
                        $('.alert').html(alertSuccess);

                        show();
                    } else {
                        alert("data gagal disimpan");
                        $(".btnsave").attr('id', 'add');
                    }
                },
                error: function () {
                    alert("Error");
                    $(".btnsave").attr('id', 'add');
                }
            });
        };
    });

    // $('#editId').click(function () {
    //     $("button").attr('id', 'update');
    // });

    // $('#update').click(function () {
    //     var id = document.getElementById("id");
    //     var nama = document.getElementById("nama");
    //     var no_ktp = document.getElementById("no_ktp");
        
    //     var isValid = $("#tambah-data").valid();

    //     if ($('#nama').val().trim() == '') {
    //         $('#nama').focus();
    //         return false;
    //     }

    //     if ($('#no_ktp').val().trim() == '') {
    //         $('#no_ktp').focus();
    //         return false;
    //     }

    //     if (isValid) {
    //         $.ajax({
    //             type: "POST",
    //             url: "/warga/save",
    //             data: "id=" + id.value + "nama=" + nama.value + "&no_ktp=" + no_ktp.value,
    //             success: function (response) {
    //                 if (response == 1) {
    //                     var alertSuccess = '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil diubah!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

    //                     $('#dataBaruModal').modal('hide');
                    
    //                     $('body').removeClass('modal-open');
    //                     $('.modal-backdrop').remove();
                        
    //                     $('#dataBaruModal form :input').val("");
    //                     setTimeout(function () {
    //                         $("[data-dismiss=modal]").trigger({ type: "click" });
    //                     }, 100)
                        
    //                     // $('#dataBaruModal').modal('hide');

    //                     // $(".btnsimpan").click(function () {
    //                     //     $("#dataBaruModal").removeClass('fade').modal('hide');
    //                     //     $("#dataBaruModal").modal("dispose");
    //                     // })

    //                     // window.location = "/warga/view";
                        
    //                     $('.alert').html(alertSuccess)

    //                     show();
    //                 } else {
    //                     alert("data gagal diubah")
    //                 }
    //             },
    //             error: function () {
    //                 alert("Error");
    //             }
    //         });
    //     };
    // });

    $(document).on('click', "#update", function () {
        var data = $('#tambah-data').serialize();

        var isValid = $("#tambah-data").valid();

        if ($('#nama').val().trim() == '') {
            $('#nama').focus();
            return false;
        }

        if ($('#no_ktp').val().trim() == '') {
            $('#no_ktp').focus();
            return false;
        }

        if (isValid) {
            $.ajax({
                type: 'POST',
                url: '/warga/update',
                data: data,
                cache: false,
                success: function (response) {
                    if (response == 1) {
                        var alertSuccess = '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil diubah!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

                        $('#dataVaruModal').modal('hide');
                
                        $('body').removeClass('modal-open');
                        $('.modal-backdrop').remove();

                        $('#dataBaruModal form :input').val("");
                        setTimeout(function () {
                            $("[data-dismiss=modal]").trigger({ type: "click" });
                        }, 100)

                        $(".btnsave").attr('id', 'add');
                        
                        $('.alert').html(alertSuccess);
                        
                        show();
                    } else {
                        alert("data gagal tersimpan")
                        $(".btnsave").attr('id', 'add');
                    }
                },
                error: function () {
                    alert("error saat menyimpan data");
                    $(".btnsave").attr('id', 'add');
                }
            });
        }
    });
});
//     $('.update').click(function() {
//         var id = $(e.relatedTarget).data('id');
//         $.ajax({
//             url: '/warga/get',
//             method: 'post',
//             data: 'id=' + id,
//             success: function (data) {
//                 $('#myModal').modal("show");
//                 $('#tampil_modal').html(data);
//                 document.getElementById("id").value = res.id;
//                 document.getElementById("nama").value = res.nama;
//                 document.getElementById("no_ktp").value = res.no_ktp;
//                 document.getElementById("judul").innerHTML = 'Edit Data';
//             }, error: function (res) {
//                 // console.log(response.responseText);
//                 alert("gagal mengambil data");
//             }
//         });
//     });


// function saveWarga() {
//     var obj;

//     if ($('#nama').val().trim() == '') {
//         $('#nama').focus();
//         return false;
//     }

//     if ($('#no_ktp').val().trim() == '') {
//         $('#no_ktp').focus();
//         return false;
//     }

//     $.post("/warga/save", $("#tambah-data").serialize(), function (res) {
//         obj = JSON.parse(res);
//         if (obj.return) {
//             $('#dataBaruModal').modal('hide');
//             location.reload();
//         } else {
//             alert(obj.msg);
//         }
//     });
// }

function deleteWarga() {
    var obj, id = $('#id').val();

    $.ajax({
        url: '/warga/delete',
        method: 'post',
        data: { id: id },
        success: function (res) {
            obj = JSON.parse(res);
            if (obj.return) {

                var alertSuccess = '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil dihapus!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
                
                $('#deleteModal').modal('hide');
                
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                $('#deleteModal form :input').val("");
                setTimeout(function () {
                    $("[data-dismiss=modal]").trigger({ type: "click" });
                }, 100)
                
                $('.alert').html(alertSuccess);

                show();
            } else {
                alert("data gagal disimpan");

                $('#deleteModal').modal('hide');
                location.reload();
            } 
            // else {
            //     alert(obj.msg);
        }
    });

    // $.post("/warga/delete", { id: id }, function (res) {
    //     obj = JSON.parse(res);
    //     if (obj.return) {
    //         $('#deleteModal').modal('hide');
    //         location.reload();
    //     } else {
    //         alert(obj.msg);
    //     }
    // });
}

//     $('.hapus').click(function () {
//         var id = $(this).attr("id");
//         $.ajax({
//             url: '/warga/delete',
//             method: 'post',
//             data: { id: id },
//             success: function (data) {
//                 $('#myModal').modal("show");
//                 $('#tampil_data').html(data);
//                 document.getElementById("judul").innerHTML = 'Hapus Data';
//             }
//         });
//     });

    
// });

function show() {
    $.ajax({
        type: 'post',
        url: "/warga/view",
        cache: false,
        success: function (data) {
            $("#tampil").html(data);
        }
    });
}

function toEdit() {
    $(".btnsave").attr('id', 'update');
}

// function detailedit(id) {


//     $('#id').val(id);
//     showwarga(id);
// }

// function showwarga(id) {
//     if(! id){
//         $('#id').val('');
//     }else{
//         $.ajax({
//             type: 'post',
//             url: '/warga/update',
//             data: 'id='+ id,
//             success: function(res){
//                 var obj = JSON.parse(res);
//                 $('#id').val(obj.id);
//                 $('#nama').val(obj.nama);
//                 $('#no_ktp').val(obj.no_ktp);
//                 view.ajax.reload();
//             }
//         });
//     }
// }

// function doEdit() {
//     var id=document.getElementById("id");
//     var nama=document.getElementById("nama");
//     var no_ktp=document.getElementById("no_ktp");

//         $.ajax({
//             type: "POST",
//             url:"/warga/update",
//             data:"id="+id.value+"nama="+nama.value+"&no_ktp="+no_ktp.value,
//             success: function (response) {
//                 if(response==1) {
//                     alert("data berhasil disimpan")
//                     window.location = "/warga/view";
//                 }else{
//                     alert("data gagal disimpan")
//                 }
//             },
//             error: function() {
//                 alert("data gagal disimpan");
//             }
//         });
// }

// function reset() {
//     document.getElementById("nama").innerHTML = "";
//     document.getElementById("no_ktp").innerHTML = "";
// }

// $(document).on('click', '.edit', function () {
//     var id = $(this).attr('id');
//     $.ajax({
//         type: 'POST',
//         url: '/warga/get',
//         data: { id: id },
//         success: function (response) {
//             reset();
//             document.getElementById("id").value = response.id;
//             document.getElementById("nama").value = response.nama;
//             document.getElementById("no_ktp").value = response.no_ktp;
//         },
//         error: function (response) {
//             // console.log(response.responseText);
//             alert("gagal ngambil data2");
//         }
//     });
// });

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();

    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}