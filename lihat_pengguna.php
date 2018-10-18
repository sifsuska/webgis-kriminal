<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Kelola Pengguna";
$config['hal_aktif'] = "user";
hak_akses([1],TRUE);
include('header.php');
?>

<div class="col-sm-12">
  <div class="btn-group" style="margin:25px 5px">
   <a href="form_pengguna.php" class="btn btn-primary btn-md"><span class="fa fa-plus"></span> Tambah Pengguna</a>
  </div>
  <table class="table table-striped table-bordered">
   <thead>
    <tr>
     <th>Username</th>
     <th>Level Sistem</th>
     <th>Aksi</th>
    </tr>
   </thead>
   <tbody>
    <?php 
    $query = mysqli_query($kon, "select * from pengguna");
    while($row=mysqli_fetch_assoc($query)){ ?>
    <tr>
     <td><?= $row['username'] ?></td>
     <td><?= ($row['level'] === '1')?"Administrator":"Operator" ?></td>
     <td><a href="form_pengguna.php?edit=<?= $row['id_pengguna'] ?>"><span class="fa fa-pencil"></span> Ubah</a> | <a href="form_password.php?id=<?= $row['id_pengguna'] ?>"><span class="fa fa-key"></span> Ubah Password</a> | <a href="hapus.php?table=pengguna&id=<?= $row['id_pengguna'] ?>" onclick="return confirm('Hapus pengguna ini?');"><span class="fa fa-close"></span> Hapus</a>
    </tr>
    <?php } ?>
   </tbody>
  </table>
</div>
<?php
include('footer.php');