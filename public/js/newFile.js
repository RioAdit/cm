$(document).ready(function () {
  $("#ae-data").validate({
    rules: {
      nama: {
        required: true,
        minlength: 3,
      },
      kontak: {
        required: true,
        minlength: 3,
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
      },
      email: {
        required: true,
        email: true,
        minlength: 3,
      },
    },
    messages: {
      nama: {
        required: "Tolong masukkan Nama",
        minlength: "Nama tidak boleh kurang dari 3 huruf",
      },
      kontak: {
        required: "Tolong masukkan Keterangan Kontak",
        minlength: "Kontak tidak boleh kurang dari 3 huruf",
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
        minlength: "Nomor telepon tidak boleh kurang dari 3 huruf",
      },
      email: {
        required: "Tolong masukkan Email",
        email: "Tolong masukkan format email yang tepat",
        minlength: "Email tidak boleh kurang dari 3 huruf",
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
          $("#tgl_dibuat").val(obj.tgl_dibuat);
          $("#nama").val(obj.nama);
          $("#produk").val(obj.produk);
          $("#wilayah").val(obj.wilayah);
          $("#tipe_kon").val(obj.tipe_kon);
          $("#no_telp").val(obj.no_telp);
          $("#email").val(obj.email);
          // console.log("clicked ada");
        },
      });
    }
  });

  $(document).on("click", "#profileId", function () {
    var idkon = $(e.relatedTarget).attr("data-idkon");
    console.log("The data-id of clicked item is: " + idkon);
    $.ajax({
      type: "post",
      url: "/contact/profile",
      cache: false,
      success: function (data) {
        $("#tampil").html(data);

        $("#liDash, #liList, #liImp").attr("class", "");

        $("#liProf").attr("class", "active");
      },
      complete: function (e) {
        console.log("Request 1 was performed.");

        if (!idkon) {
          $("#idkon").val("-");
          $("#iddel").val("-");
          $("#tgl_dibuat").val("-");
          $("#nama").val("-");
          $("#produk").val("-");
          $("#wilayah").val("-");
          $("#tipe_kon").val("-");
          $("#no_telp").val("-");
          $("#email").val("-");
          console.log("clicked when id null");
        } else {
          $.ajax({
            type: "post",
            url: "/contact/get",
            data: "idkon=" + idkon,
            success: function (res) {
              var obj = JSON.parse(res);

              $("#idkon").val(obj.idkon);
              $("#iddel").val(obj.idkon);
              $("#tgl_dibuat").val(obj.tgl_dibuat);
              $("#nama").val(obj.nama);
              $("#produk").val(obj.produk);
              $("#wilayah").val(obj.wilayah);
              $("#tipe_kon").val(obj.tipe_kon);
              $("#no_telp").val(obj.no_telp);
              $("#email").val(obj.email);
              console.log("clicked ada");
            },
          });
        }
      },
    });
    return false;
  });

  $(document).on("click", "#add", function () {
    // var tgl_dibuat = document.getElementById("tgl_dibuat");
    // var nama = document.getElementById("nama");
    // var kontak = document.getElementById("kontak");
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
        success: function (response) {
          if (response == 1) {
            var alertSuccess =
              '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Kontak Berhasil disimpan!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

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
        success: function (response) {
          if (response == 1) {
            var alertSuccess =
              '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Sukses!</strong> Data Warga Berhasil diubah!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';

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

  $("#sparkline1").sparkline([34, 43, 43, 35, 44, 32, 44, 48], {
    type: "line",
    width: "100%",
    height: "50",
    lineColor: "#1ab394",
    fillColor: "transparent",
  });

  $("#form")
    .steps({
      bodyTag: "fieldset",
      onStepChanging: function (event, currentIndex, newIndex) {
        // Always allow going backward even if the current step contains invalid fields!
        if (currentIndex > newIndex) {
          return true;
        }

        // Forbid suppressing "Warning" step if the user is to young
        if (newIndex === 3 && Number($("#age").val()) < 18) {
          return false;
        }

        var form = $(this);

        // Clean up if user went backward before
        if (currentIndex < newIndex) {
          // To remove error styles
          $(".body:eq(" + newIndex + ") label.error", form).remove();
          $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
        }

        // Disable validation on fields that are disabled or hidden.
        form.validate().settings.ignore = ":disabled,:hidden";

        // Start validation; Prevent going forward if false
        return form.valid();
      },
      onStepChanged: function (event, currentIndex, priorIndex) {
        // Suppress (skip) "Warning" step if the user is old enough.
        if (currentIndex === 2 && Number($("#age").val()) >= 18) {
          $(this).steps("next");
        }

        // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
        if (currentIndex === 2 && priorIndex === 3) {
          $(this).steps("previous");
        }
      },
      onFinishing: function (event, currentIndex) {
        var form = $(this);

        // Disable validation on fields that are disabled.
        // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
        form.validate().settings.ignore = ":disabled";

        // Start validation; Prevent form submission if false
        return form.valid();
      },
      onFinished: function (event, currentIndex) {
        var form = $(this);

        // Submit form input
        form.submit();
      },
    })
    .validate({
      errorPlacement: function (error, element) {
        element.before(error);
      },
      rules: {
        confirm: {
          equalTo: "#password",
        },
      },
    });

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
