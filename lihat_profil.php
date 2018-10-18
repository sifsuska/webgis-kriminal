<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Kelola Konten Profil";
$config['hal_aktif'] = "profil";
hak_akses([1],TRUE);
include('header.php');
?>

<div class="col-sm-12">
  <div class="btn-group" style="margin:25px 5px">
   <a href="form_profil.php" class="btn btn-primary btn-md"><span class="fa fa-plus"></span> Tambah Konten</a>
  </div>
  <table class="table table-striped table-bordered">
   <thead>
    <tr>
     <th>Judul</th>
     <th>Terakhir Diubah</th>
     <th>Aksi</th>
    </tr>
   </thead>
   <tbody>
    <?php 
    $query = mysqli_query($kon, "select id_konten,judul_konten,tgl_terbit_konten from konten");
    while($row=mysqli_fetch_assoc($query)){ ?>
    <tr>
     <td><?= $row['judul_konten'] ?></td>
     <td><?= tanggal($row['tgl_terbit_konten'], true) ?></td>
     <td><a href="profil.php?id=<?= $row['id_konten'] ?>" target="_blank"><span class="fa fa-eye"></span> Lihat</a> | <a href="form_profil.php?edit=<?= $row['id_konten'] ?>"><span class="fa fa-pencil"></span> Ubah</a> | <a href="hapus.php?table=konten&id=<?= $row['id_konten'] ?>" onclick="return confirm('Hapus konten ini?');"><span class="fa fa-close"></span> Hapus</a>
    </tr>
    <?php } ?>
   </tbody>
  </table>
</div>
<?php
include('footer.php');