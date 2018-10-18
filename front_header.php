<?php
include_once('config/koneksi.php');
?>
<!doctype html>
<head>
    <meta charset="utf-8">
    <title><?= $config['nama_website'] ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Sistem Informasi Titik Perceraian Kota Pekanbaru">
    <meta name="author" content="Sistem Informasi Titik Perceraian Kota Pekanbaru">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/site-front.css"/>
    <?= $vws->get_inline() ?>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom:60px">
      <div class="container">
       <div class="navbar-header page-scroll">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar">
             <span class="sr-only">Toggle navigation</span>
             <i class="fa fa-bars"></i>
         </button>
         <a class="navbar-brand" href="index.php"><?= $config['nama_website'] ?></a>
        </div>
        <div class="navbar-collapse collapse" id="bs-navbar">
          <ul class="nav navbar-nav">
            <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Profil</a>
             <ul class="dropdown-menu">
              <?php 
              $query = mysqli_query($kon, "select id_konten, judul_konten from konten");
              while($row=mysqli_fetch_assoc($query)) { ?>
              <li><a href="profil.php?id=<?= $row['id_konten'] ?>"><?= $row['judul_konten'] ?></a></li>
              <?php } ?>
             </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <li><a href="login.php" class="navbar-link">Login</a></li>           
           </ul>
          </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>