<?php
include('front_header.php');
$id = $_GET['id'];
$query = mysqli_query($kon, "select * from konten where id_konten='".$id."'");
$profil = mysqli_fetch_assoc($query);
?>
<div class="container" style="min-height:75vh">
 <div class="row">
  <div class="col-sm-8">
  <h2><?= $profil['judul_konten']; ?></h2>
   <p><small>Terakhir diperbarui pada <?= tanggal($profil['tgl_terbit_konten']) ?></small></p>
   <?= html_entity_decode($profil['isi_konten']) ?>
  </div>
  <div class="col-sm-4">
   
  </div>
 </div>
</div>
<?php
include('front_footer.php');