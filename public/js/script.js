$(document).ready(function () {
  $("#ae-data").validate({
    rules: {
      nama: {
        required: true,
        minlength: 3,
        maxlength: 255,
      },
      produk: {
        required: true,
      },
      wilayah: {
        required: true,
      },
      tipe_kon: {
        required: true,
      },
      no_telp: {
        required: true,
        number: true,
        minlength: 3,
        maxlength: 20,
      },
      email: {
        required: true,
        email: true,
        minlength: 3,
        maxlength: 255,
      },
    },
    messages: {
      nama: {
        required: "Tolong masukkan Nama",
        minlength: "Nama tidak boleh kurang dari 3 huruf",
        maxlength: "Maaf, nama tidak boleh lebih dari 255 huruf",
      },
      produk: {
        required: "Tolong pilih Keterangan Produk",
      },
      wilayah: {
        required: "Tolong pilih Keterangan Wilayah",
      },
      tipe_kon: {
        required: "Tolong pilih tipe Kontak",
      },
      no_telp: {
        required: "Tolong masukkan nomor telepon",
        number: "Nomor telepon hanya bisa menggunakan angka",
        minlength: "Nomor telepon tidak boleh kurang dari 3 angka",
        maxlength: "Maaf, nomor telepon tidak boleh lebih dari 20 angka",
      },
      email: {
        required: "Tolong masukkan Email",
        email: "Tolong masukkan format email yang tepat",
        minlength: "Email tidak boleh kurang dari 3 huruf",
        maxlength: "Maaf, email tidak boleh lebih dari 255 huruf",
      },
    },
  });

  $("#formNote").validate({
    rules: {
      note: {
        maxlenght: 255,
      },
    },
    messages: {
      note: {
        maxlenght: "Maaf, Note tidak boleh lebih dari 255 huruf",
      },
    },
  });

  $("#myModal2, #deleteModal").on("shown.bs.modal", function (e) {
    var idkon = $(e.relatedTarget).attr("data-idkon");
    if (!idkon) {
      $("#idkon").val("");
      $("#iddel").val("");
      $("#tgl_dibuat").val("");
      $("#nama").val("");
      $("#produk").val("");
      $("#wilayah").val("");
      $("#tipe_kon").val("");
      $("#no_telp").val("");
      $("#email").val("");
      // console.log("clicked when id null");
    } else {
      $.ajax({
        type: "post",
        url: "/contact/get",
        data: "idkon=" + idkon,
        success: function (res) {
          var obj = JSON.parse(res);

          $("#idkon").val(obj.idkon);
          $("#iddel").val(obj.idkon);
          $("#nama").val(obj.nama);
          Array.from(document.querySelector(".sProd").options).forEach(
            (option) => {
              if (option.value == obj.produk) option.selected = true;
            }
          );
          Array.from(document.querySelector(".sWila").options).forEach(
            (option) => {
              if (option.value == obj.wilayah) option.selected = true;
            }
          );
          Array.from(document.querySelector(".sTipe").options).forEach(
            (option) => {
              if (option.value == obj.tipe_kon) option.selected = true;
            }
          );
          // $("#produk").val(obj.produk);
          // $("#wilayah").val(obj.wilayah);
          // $("#tipe_kon").val(obj.tipe_kon);
          $("#no_telp").val(obj.no_telp);
          $("#email").val(obj.email);
          // console.log("clicked ada");
        },
      });
    }
  });

  $("#modalEditProf").on("shown.bs.modal", function () {
    var idkon = $("#idkon").val();

    $.ajax({
      type: "post",
      url: "/contact/get",
      data: "idkon=" + idkon,
      complete: function (res) {
        var obj = JSON.parse(res);

        $("#idkon").val(obj.idkon);
        $("#nama").val(obj.nama);
        Array.from(document.querySelector(".sProd").options).forEach(
          (option) => {
            if (option.value == obj.produk) option.selected = true;
          }
        );
        Array.from(document.querySelector(".sWila").options).forEach(
          (option) => {
            if (option.value == obj.wilayah) option.selected = true;
          }
        );
        Array.from(document.querySelector(".sTipe").options).forEach(
          (option) => {
            if (option.value == obj.tipe_kon) option.selected = true;
          }
        );
        // $("#produk").val(obj.produk);
        // $("#wilayah").val(obj.wilayah);
        // $("#tipe_kon").val(obj.tipe_kon);
        $("#no_telp").val(obj.no_telp);
        $("#email").val(obj.email);
        // console.log("clicked ada");
      },
    });
  });

  $(document).on("click", ".toProfile", function () {
    var idkon = $(this).data("idkon");
    // var idkon = $(e.relatedTarget).attr("data-idkon");
    // console.log("data id: " + idkon);
    // console.log(this);
    // console.log($(this).data("idkon"));
    $.ajax({
      type: "post",
      url: "/contact/profile",
      data: "idkon=" + idkon,
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liList, #liImp").attr("class", "");

        $("#liProf").attr("class", "active");
      },
      complete: function () {
        // console.log("Request 1 work");

        if (!idkon) {
          $("#idkon").val("-");
          $("#idkn").val("-");
          $("#idka").val("-");
          $("#tgl_dibuat").val("-");
          $("#nama").val("-");
          $("#produk").val("-");
          $("#wilayah").val("-");
          $("#tipe_kon").val("-");
          $("#no_telp").val("-");
          $(".email").val("-");
          console.log("id kosong");
        } else {
          $.ajax({
            type: "post",
            url: "/contact/getProfile",
            data: "idkon=" + idkon,
            success: function (res) {
              console.log("data id: " + idkon);
              var obj = JSON.parse(res);

              $("#idkon").val(obj.idkon);
              $("#idkn").val(obj.idkon);
              $("#idka").val(obj.idkon);
              $("#tgl_dibuat").val(obj.tgl_dibuat + " WIB");
              $("#nama").val(obj.nama);
              Array.from(document.querySelector(".psProd").options).forEach(
                (option) => {
                  if (option.value == obj.produk) option.selected = true;
                }
              );
              Array.from(document.querySelector(".psWila").options).forEach(
                (option) => {
                  if (option.value == obj.wilayah) option.selected = true;
                }
              );
              Array.from(document.querySelector(".psTipe").options).forEach(
                (option) => {
                  if (option.value == obj.tipe_kon) option.selected = true;
                }
              );
              $("#no_telp").val(obj.no_telp);
              $(".email").val(obj.email);
              /* $("#produk").val(obj.produk);

              $("#wilayah").val(obj.wilayah);
              $("#tipe_kon").val(obj.tipe_kon);
              
              $("#ket").val(obj.keterangan);
              $("#ket").each(function () {
                $(this).val(obj.keterangan);
              });
              $("#waktu").each(function () {
                $(this).val(obj.waktu);
              });
              $( "#waktul" ).each(function( index ) {
                console.log( index + ": " + $( this ).text() );
              });
              console.log("id ada");
              console.log(obj.nama); */

              showNote();
              showAct();
            },
          });
        }
      },
      error: function () {
        console.log("ada yang error");
      },
    });
    // return false;
  });

  // $("#editProf").on("click", function () {
  //   $("#formDetail input").removeAttr("disabled");
  //   $("#formDetail select").removeClass("-plaintext");
  // });

  // $(".sProd, .sWila, .sTipe").change(function () {
  //   console.log($(this).find(":selected").val());
  // });

  // $("#ae-data").on("hidden.bs.modal", function () {
  //   $("select").val("0").trigger("change");
  // });

  $(document).on("click", ".alert", function () {
    $("#alert").attr("class", "");
  });

  $(document).on("click", "#add", function () {
    // var tgl_dibuat = document.getElementById("tgl_dibuat");
    // var nama = document.getElementById("nama");
    // var produk = document.getElementById("produk");
    // var wilayah = document.getElementById("wilayah");
    // var tipe_kon = document.getElementById("tipe_kon");
    // var no_telp = document.getElementById("no_telp");
    // var email = document.getElementById("email");

    var isValid = $("#ae-data").valid();

    if (isValid) {
      $.ajax({
        type: "POST",
        url: "/contact/save",
        data: $("#ae-data").serialize(),
        // data: "tgl_dibuat=" + tgl_dibuat.value + "&nama=" + nama.value + "&kontak=" + kontak.value + "&produk=" + produk.value + "&wilayah=" + wilayah.value + "&tipe_kon=" + tipe_kon.value + "&no_telp=" + no_telp.value + "&email=" + email.value,
        beforeSend: function () {
          $("#alert").attr("class", "alert");
        },
        success: function (response) {
          if (response == 1) {
            var alertSuccess =
              '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Kontak Berhasil disimpan!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

            $("sProd, sWila, sTipe").prop("selectedIndex", 0);

            $("#myModal2").modal("hide");

            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();

            $("#myModal2 form :input").val("");

            setTimeout(function () {
              $("[data-dismiss=modal]").trigger({ type: "click" });
            }, 100);

            $(".btnsave").attr("id", "add");

            $(".alert").html(alertSuccess);

            showList();
          } else {
            alert("data gagal disimpan");
            $(".btnsave").attr("id", "add");
          }
        },
        error: function () {
          alert("Error");
          $(".btnsave").attr("id", "add");
        },
      });
    }
  });

  $(document).on("click", "#update", function () {
    var data = $("#ae-data").serialize();

    var isValid = $("#ae-data").valid();

    if (isValid) {
      $.ajax({
        type: "POST",
        url: "/contact/update",
        data: data,
        cache: false,
        beforeSend: function () {
          $("#alert").attr("class", "alert");
        },
        success: function (response) {
          if (response == 1) {
            var alertSuccess =
              '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Kontak Berhasil diubah!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

            $("#myModal2").modal("hide");

            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();

            $("#myModal2 form :input").val("");

            setTimeout(function () {
              $("[data-dismiss=modal]").trigger({ type: "click" });
            }, 100);

            $(".btnsave").attr("id", "add");

            setTimeout(function () {
              $(".alert").html(alertSuccess);
            }, 1000);

            showList();
          } else {
            alert("data gagal tersimpan");
            $(".btnsave").attr("id", "add");
          }
        },
        error: function () {
          alert("error saat menyimpan data");
          $(".btnsave").attr("id", "add");
        },
      });
    }
  });

  $(document).on("click", "#btnSaveNote", function () {
    // var isValid = $("#formNote").valid();
    var note_data = {
      note: $("#note").val(),
      idkon: $("#idkon").val(),
    };

    $.ajax({
      type: "POST",
      url: "/contact/saveNote",
      data: note_data,
      beforeSend: function () {
        $("#alert").attr("class", "alert");
      },
      success: function (response) {
        if (response == 1) {
          var alertSuccess =
            '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Note berhasil disimpan!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

          $("#note").val("");

          $(".alert").html(alertSuccess);

          // $("#showNote").load(location.href + " #showNote");

          showNote();

          // console.log("dijalankan");
        } else {
          alert("data gagal disimpan");
        }
      },
      error: function () {
        alert("Error");
      },
    });
  });

  $(document).on("click", "#btnSaveAct", function () {
    // var isValid = $("#formAct").valid();
    var act_data = {
      judul_act: $("#judul_act").val(),
      tgl_act: $("#tgl_act").val(),
      jam_act: $("#jam_act").val(),
      note_act: $("#note_act").val(),
      idkon: $("#idkon").val(),
    };

    $.ajax({
      type: "POST",
      url: "/contact/saveAct",
      data: act_data,
      beforeSend: function () {
        $("#alert").attr("class", "alert");
      },
      success: function (response) {
        if (response == 1) {
          var alertSuccess =
            '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Activity berhasil disimpan!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

          $("#judul_act").val("");
          $("#tgl_act").val("");
          $("#jam_act").val("");
          $("#note_act").val("");

          $(".alert").html(alertSuccess);

          // $("#showAct").load(location.href + " #showAct");

          showAct();
        } else {
          alert("data gagal disimpan");
        }
      },
      error: function () {
        alert("Error");
      },
    });
  });

  $(document).on("click", "#btnDelNote", function () {
    var obj;
    var idnote = {
      idnote: $(this).data("idnote"),
    };
    $.ajax({
      url: "/contact/deleteNote",
      method: "post",
      data: idnote,
      // beforeSend: function () {
      //   var idnote = $("#idnote").val();
      //   $.ajax({
      //     type: "post",
      //     url: "/contact/get",
      //     data: "idnote=" + idnote,
      //     success: function (res) {
      //       var obj = JSON.parse(res);

      //       $("#idkon").val(obj.idkon);
      //       $("#iddel").val(obj.idkon);
      //       $("#nama").val(obj.nama);
      //       Array.from(document.querySelector(".sProd").options).forEach(
      //         (option) => {
      //           if (option.value == obj.produk) option.selected = true;
      //         }
      //       );
      //       Array.from(document.querySelector(".sWila").options).forEach(
      //         (option) => {
      //           if (option.value == obj.wilayah) option.selected = true;
      //         }
      //       );
      //       Array.from(document.querySelector(".sTipe").options).forEach(
      //         (option) => {
      //           if (option.value == obj.tipe_kon) option.selected = true;
      //         }
      //       );
      //       // $("#produk").val(obj.produk);
      //       // $("#wilayah").val(obj.wilayah);
      //       // $("#tipe_kon").val(obj.tipe_kon);
      //       $("#no_telp").val(obj.no_telp);
      //       $("#email").val(obj.email);
      //       // console.log("clicked ada");
      //     },
      //   });
      // },
      success: function (res) {
        obj = JSON.parse(res);
        if (obj.return) {
          showNote();
        } else {
          alert("data gagal dihapus");
        }
      },
    });
  });

  $(document).on("click", "#btnDelAct", function () {
    var obj;
    var idact = {
      idact: $(this).data("idact"),
    };
    $.ajax({
      url: "/contact/deleteAct",
      method: "post",
      data: idact,
      success: function (res) {
        obj = JSON.parse(res);
        if (obj.return) {
          showAct();
        } else {
          alert("data gagal dihapus");
        }
      },
    });
  });

  $(document).on("click", "#btnSendMail", function () {
    var obj,
      mail = {
        nama: $("#namaM").val(),
        to: $("#emailTo").val(),
        sub: $("#emailSub").val(),
        con: $("#emailCon").val(),
      };
    $.ajax({
      url: "/contact/sendMail",
      method: "post",
      data: mail,
      beforeSend: function () {
        $("#alert").attr("class", "alert");
        
        setTimeout(function () {
          $("[data-dismiss=modal]").trigger({ type: "click" });
        }, 100);

        $("body").addClass("loading");
      },
      success: function (res) {
        obj = JSON.parse(res);
        if (obj.return) {
          
          var alertSuccess =
            '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Mail Berhasil Terkirim!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

          $(".alert").html(alertSuccess);

          $("body").removeClass("modal-open");
          $(".modal-backdrop").remove();

          discardMail();
        } else {
          alert("Mail gagal terkirim");
        }
      },
      complete: function () {
        $("body").removeClass("loading");
      },
    });
  });

  $(document).on("click", "#discardMail", function () {
    discardMail();
  });

  $("li").on("click", "#lDash", function () {
    $.ajax({
      type: "post",
      url: "/contact/view",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liList, #liProf, #liImp").attr("class", "");

        $("#liDash").attr("class", "active");
      },
    });
    return false;
  });

  $("li").on("click", "#lList", function () {
    $.ajax({
      type: "post",
      url: "/contact/list",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liProf, #liImp").attr("class", "");

        $("#liList").attr("class", "active");
      },
    });
    return false;
  });

  $("li").on("click", "#lProf", function () {
    $.ajax({
      type: "post",
      url: "/contact/profile",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liList, #liImp").attr("class", "");

        $("#liProf").attr("class", "active");
      },
    });
    return false;
  });

  $("li").on("click", "#lImp", function () {
    $.ajax({
      type: "post",
      url: "/contact/import",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liList, #liProf").attr("class", "");

        $("#liImp").attr("class", "active");
      },
    });
    return false;
  });

  $(document).on("click", "#alistImp", function () {
    $.ajax({
      type: "post",
      url: "/contact/import",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liList, #liProf").attr("class", "");

        $("#liImp").attr("class", "active");
      },
    });
    return false;
  });

  $(document).on("click", "#dlExam", function () {
    // var file = {
    //   file: "/files/example.csv",
    // }

    $.ajax({
      type: "post",
      url: "/contact/dlExam",
      // data: file,
      cache: false,
      success: function (data) {
        console.log("terdownload");
      },
    });
    return false;
  });

  $(document).on("click", "#importFile", function (event) {
    event.preventDefault();
    var dataImp = {
      file: $("#myDropzone").val(),
    }

    $.ajax({
      url:"/contact/mapData",
      method:"POST",
      data: dataImp,
      // dataType:'json',
      contentType:false,
      cache:false,
      processData:false,
      success:function(data)
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

  // $(document).on("click", "#mapp", function () {
  //   var file = $("#csv_file").val();

  //   $.ajax({
  //     type: "post",
  //     url: "/contact/mapping",
  //     data: file,
  //     contentType:false,
  //     cache:false,
  //     processData:false,
  //     success: function (data) {
  //       $("#tampil").html(data);
  //     },
  //     complete: function () {
  //       $.get(file, function(data) {

  //         // start the table
  //         var html = '<div class="ibox"><div class="ibox-content"><table class="table table-bordered">';
          
  //         // split into lines
  //         var rows = data.split("\n");
          
  //         // parse lines
  //         rows.forEach( function getvalues(ourrow) {
          
  //         // start a table row
  //         html += "<tr>";
          
  //         // split line into columns
  //         var columns = ourrow.split(",");
          
  //         html += "<td>" + columns[0] + "</td>";
  //         html += "<td>" + columns[1] + "</td>";
  //         html += "<td>" + columns[2] + "</td>";
  //         html += "<td>" + columns[3] + "</td>";
  //         html += "<td>" + columns[4] + "</td>";
  //         html += "<td>" + columns[5] + "</td>";
          
  //         // close row
  //         html += "</tr>";
  //         })
  //         // close table
  //         html += "</table></div></div>";
          
  //         // insert into div
  //         $('#process_area').append(html);
          
  //         });
  //     },
  //   });
  //   return false;
  // });

  WinMove();

  $("#dataTables").DataTable();

  $("#dataT").DataTable({
    fixedColumns: {
      right: 1,
    },
    // paging: false,
    scrollCollapse: true,
    scrollX: true,
    scrollY: 300,
  });

  $(".i-checks").iCheck({
    checkboxClass: "icheckbox_square-green",
    radioClass: "iradio_square-green",
  });

  // $("#form")
  //   .steps({
  //     bodyTag: "fieldset",
  //     onStepChanging: function (event, currentIndex, newIndex) {
  //       // Always allow going backward even if the current step contains invalid fields!
  //       if (currentIndex > newIndex) {
  //         return true;
  //       }

  //       // Forbid suppressing "Warning" step if the user is to young
  //       if (newIndex === 3 && Number($("#age").val()) < 18) {
  //         return false;
  //       }

  //       var form = $(this);

  //       // Clean up if user went backward before
  //       if (currentIndex < newIndex) {
  //         // To remove error styles
  //         $(".body:eq(" + newIndex + ") label.error", form).remove();
  //         $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
  //       }

  //       // Disable validation on fields that are disabled or hidden.
  //       form.validate().settings.ignore = ":disabled,:hidden";

  //       // Start validation; Prevent going forward if false
  //       return form.valid();
  //     },
  //     onStepChanged: function (event, currentIndex, priorIndex) {
  //       // Suppress (skip) "Warning" step if the user is old enough.
  //       if (currentIndex === 2 && Number($("#age").val()) >= 18) {
  //         $(this).steps("next");
  //       }

  //       // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
  //       if (currentIndex === 2 && priorIndex === 3) {
  //         $(this).steps("previous");
  //       }
  //     },
  //     onFinishing: function (event, currentIndex) {
  //       var form = $(this);

  //       // Disable validation on fields that are disabled.
  //       // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
  //       form.validate().settings.ignore = ":disabled";

  //       // Start validation; Prevent form submission if false
  //       return form.valid();
  //     },
  //     onFinished: function (event, currentIndex) {
  //       var form = $(this);

  //       // Submit form input
  //       form.submit();
  //     },
  //   })
  //   .validate({
  //     errorPlacement: function (error, element) {
  //       element.before(error);
  //     },
  //     rules: {
  //       confirm: {
  //         equalTo: "#password",
  //       },
  //     },
  //   });

  $("#todo, #inprogress")
    .sortable({
      connectWith: ".connectList",
      update: function (event, ui) {
        var todo = $("#todo").sortable("toArray");
        var inprogress = $("#inprogress").sortable("toArray");
        $(".output").html(
          "ToDo: " +
            window.JSON.stringify(todo) +
            "<br/>" +
            "In Progress: " +
            window.JSON.stringify(inprogress)
        );
      },
    })
    .disableSelection();
});

function toMapping() {
  
}

function deleteContact() {
  var obj,
    idkon = $("#idkon").val();

  $.ajax({
    url: "/contact/delete",
    method: "post",
    data: { idkon: idkon },
    beforeSend: function () {
      $("#alert").attr("class", "alert");
    },
    success: function (res) {
      obj = JSON.parse(res);
      if (obj.return) {
        var alertSuccess =
          '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Kontak Berhasil dihapus!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

        $("#deleteModal").modal("hide");

        $("body").removeClass("modal-open");
        $(".modal-backdrop").remove();

        $("#myModal2 form :input").val("");

        setTimeout(function () {
          $("[data-dismiss=modal]").trigger({ type: "click" });
        }, 100);

        setTimeout(function () {
          $(".alert").html(alertSuccess);
        }, 1000);

        showList();
      } else {
        alert("data gagal disimpan");

        $("#deleteModal").modal("hide");
        location.reload();
      }
      // else {
      //     alert(obj.msg);
    },
  });
}

function deleteContactProf() {
  var obj,
    idkon = $("#idkon").val();

  $.ajax({
    url: "/contact/delete",
    method: "post",
    data: { idkon: idkon },
    beforeSend: function () {
      $("#alert").attr("class", "alert");
    },
    success: function (res) {
      obj = JSON.parse(res);
      if (obj.return) {
        var alertSuccess =
          '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Kontak Berhasil dihapus!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

        $("#deleteModal").modal("hide");

        $("body").removeClass("modal-open");
        $(".modal-backdrop").remove();

        $("#myModal2 form :input").val("");

        setTimeout(function () {
          $("[data-dismiss=modal]").trigger({ type: "click" });
        }, 100);

        setTimeout(function () {
          $(".alert").html(alertSuccess);
        }, 1000);

        showList();
      } else {
        alert("data gagal disimpan");

        $("#deleteModal").modal("hide");
        location.reload();
      }
      // else {
      //     alert(obj.msg);
    },
  });
}

function show() {
  $.ajax({
    type: "post",
    url: "/contact/view",
    cache: false,
    success: function (data) {
      $("#tampil").html(data);
    },
  });
  return false;
}

function showList() {
  $.ajax({
    type: "post",
    url: "/contact/list",
    cache: false,
    success: function (data) {
      $("#tampil").html(data);
    },
  });
}

function showProf() {
  $.ajax({
    type: "post",
    url: "/contact/profile",
    cache: false,
    success: function (data) {
      $("#tampil").html(data);
    },
  });
}

// function showDetail() {
//   var id = $("#idkon").val();

//   $.ajax({
//     type: "post",
//     url: "/contact/profile",
//     data: { idkon: id },
//     cache: false,
//     success: function (data) {
//       $("#tampilDetail").html(data);
//       console.log("idkon di detail : " + id);
//     },
//   });
// }

function showAct() {
  var id = $("#idkon").val();

  $.ajax({
    type: "post",
    url: "/contact/activity",
    data: { idkon: id },
    cache: false,
    success: function (data) {
      $("#tampilAct").html(data);
      console.log("idkon di activity : " + id);
    },
  });
}

function showNote() {
  var id = $("#idkon").val();

  $.ajax({
    type: "post",
    url: "/contact/note",
    data: { idkon: id },
    cache: false,
    success: function (data) {
      $("#tampilNote").html(data);
      console.log("idkon di note : " + id);
    },
  });
}

function discardMail() {
  $("#emailSub").val("");
  $("#emailCon").val("");
}

function toAdd() {
  $("#judul").html("Input Data Kontak");

  $(".btnsave").attr("id", "add");
  $(".btnsave").html("Add");
}

function toEdit() {
  $("#judul").html("Edit Data Kontak");

  $(".btnsave").attr("id", "update");
  $(".btnsave").html("Save");
}
