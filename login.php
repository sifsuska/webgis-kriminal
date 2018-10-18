<?php
include_once('config/koneksi.php');
if (isset($_SESSION["level"])) {
    header("location:dash.php");
}
if(isset($_POST['username'])){
 $querylogin = mysqli_query($kon, "select * from pengguna where username = '".$_POST['username']."'");
 if(mysqli_num_rows($querylogin) == 1){
  $udata = mysqli_fetch_assoc($querylogin);
  {
   header("location:dash.php");
   $_SESSION['id_user'] = $udata['id_pengguna'];
   $_SESSION['username'] = $udata['username'];
   $_SESSION['level'] = $udata['level'];
  }
 } else {
  //
 }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Masuk ke Sistem - <?= $config['nama_website'] ?></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!--link href="assets/css/site.css" rel="stylesheet"-->
    <style>
     @import "https://fonts.googleapis.com/css?family=Exo:300,400,500,600,700";
     body {
      font-family: 'Exo', sans-serif;
      background-color: #5a5a5a;
     }
     .form-control {
      box-shadow: 0px 2px 2px 0px #a9a9a9;
      -webkit-box-shadow: 0px 2px 2px 0px #a9a9a9;
     }
     .panel-login>.panel-heading{
       background-color: #4f65ff;
       color: #fff;
     }
     .btn-login{
       background-color: #4f65ff;
       color: #fff;
       transition: 0.3s;
     }
     .btn-login:hover{
       color: #fff;
       background-color: #3b4ab3;
       transition: 0.3s;
     }
     .link-title {
      color: #fafafa;
     }
     .link-title:hover, .link-title:focus{
       color: #f8c301;
       transition: 0.3s;
     }
    </style>
</head>

<body>
  <div class="container">
   <div id="row">
    <div class="col-sm-6 col-sm-offset-3">
     <a href="index.php" class="link-title"><h3 style="text-align:center">Sistem Pemetaan Kriminal Kota Solok</h3></a>
     <div class="panel panel-login" style="margin-top:50px">
      <div class="panel-heading"><strong>Masuk Ke Sistem</strong></div>
      <div class="panel-body">
       <form name="login_pegawai" method="post" action="" class="form-horizontal">
          <div class="form-group">
           <div class="col-sm-4">
            <label class="control-label" for="username">Username</label>
           </div>
           <div class="col-sm-8">
            <input type="text" name="username" id="username" maxlength="15" class="form-control" placeholder="Nama Pengguna Anda" />
           </div>
          </div>
          <div class="form-group">
           <div class="col-sm-4">
             <label for="password_pegawai">Password</label>
           </div>
           <div class="col-sm-8">
            <input type="password" name="password" id="password_pegawai" maxlength="20" class="form-control" placeholder="Password Anda"/>
           </div>
          </div>
          <div class="form-group">
            <div class="col-sm-12">
             <button type="submit" name="login"class="btn btn-login form-control"><span class="fa fa-power-off"></span> Masuk</button>
            </div>
          </div>
        </form>
       </div>
      </div>
     </div>
    </div>
  </div>
  <script src="assets/js/jquery-3.2.1.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function() {
      $("#sidebarCollapse").on("click", function() {
        $("#sidebar").toggleClass("active");
      });
    });
  </script>
</body>
</html>