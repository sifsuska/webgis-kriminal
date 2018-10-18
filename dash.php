<?php
include('config/koneksi.php');
$config['judul_sub_halaman'] = "Dashboard";
$config['hal_aktif'] = "home";
include('header.php');
echo "<h2>Selamat Datang di ".$config['nama_website']."</h2>";
echo "Silahkan pilih menu disamping untuk melanjutkan";
include('footer.php');
?>