
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dashboard -  <?= $config['nama_website'] ?></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/site.css" rel="stylesheet">
    <?= $vws->get_inline() ?>
</head>

<body>
  <div class="wrapper">
    <nav id="sidebar">
      <div id="sidebar-header">
        <h3><?= $config['nama_website'] ?></h3>
      </div>
      
      <ul class="list-unstyled components">
        <li <?= ($config['hal_aktif'] == 'home')?'class="active"':'' ?>><a href="dash.php"><i class="fa fa-home" style="font-size: 1.5em"></i>&nbsp;&nbsp;Beranda</a></li>
        <li <?= ($config['hal_aktif'] == 'kriminal')?'class="active"':'' ?>><a href="lihat_titik.php"><i class="fa fa-gavel" style="font-size: 1.5em"></i>&nbsp;&nbsp;Kelola Data Kriminal</a></li>
         <li <?= ($config['hal_aktif'] == 'profil')?'class="active"':'' ?>><a href="lihat_profil.php"><i class="fa fa-file"style="font-size: 1.5em"></i>&nbsp;&nbsp;Kelola Konten Profil</a></li>
        <li <?= ($config['hal_aktif'] == 'user')?'class="active"':'' ?>><a href="lihat_pengguna.php"><i class="fa fa-user"style="font-size: 1.5em"></i>&nbsp;&nbsp;Kelola Data Pengguna</a></li>
        <li><a href="logout.php"><i class="fa fa-sign-out" style="font-size: 1.5em"></i>&nbsp;&nbsp;Keluar</a></li>
      </ul>
    </nav>
    <div id="content">
    <h2 id="content-title"><?= $config['judul_sub_halaman'] ?></h2>
    <hr class="hidden-print" style="border: 2px solid #5a5a5a" />