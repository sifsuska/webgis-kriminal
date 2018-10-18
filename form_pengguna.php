<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Tambah Data Pengguna";
$config['hal_aktif'] = "user";
hak_akses([1],TRUE);
if(isset($_GET['edit'])){
 $config['judul_sub_halaman'] = "Ubah Data Pengguna";
 $query = mysqli_query($kon, "select * from pengguna where id_pengguna='".$_GET['edit']."'");
 $row = mysqli_fetch_assoc($query);
} else if (isset($_POST['id_pengguna'])){
 if($_POST['id_pengguna'] === ''){
  $query = mysqli_query($kon, "insert into pengguna values('','".$_POST['username']."','".password_hash($_POST['password'],PASSWORD_DEFAULT)."','".$_POST['level']."')");
  if($query){
   echo "<script>alert('Pengguna berhasil ditambahkan!');\n document.location = 'lihat_pengguna.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan Penambahan. Kode Error: '".mysqli_error($kon).");\n document.location = 'lihat_pengguna.php'</script>";
  }
 } else {
  $query = mysqli_query($kon,"update pengguna set username='".$_POST['username']."', level=".$_POST['level']." where id_pengguna='".$_POST['id_pengguna']."'");
  if($query){
   echo "<script>alert('Data berhasil diperbarui');\n document.location = 'lihat_pengguna.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan dalam pembaruan data. Kode Error: '".mysqli_error($kon).");\n document.location = 'lihat_pengguna.php'</script>";
  }
 }
}
include('header.php');
?>
<form method="POST" action="form_pengguna.php" name="pengguna" class="form-horizontal">
 <input type="hidden" name="id_pengguna" value="<?= isset($row['id_pengguna'])?$row['id_pengguna']:'' ?>" />
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="username">Username</label>
   </div>
   <div class="col-sm-8">
    <input type="text" name="username" id="username" class="form-control" value="<?= isset($row['username'])?$row['username']:'' ?>" placeholder="Nama Pengguna" maxlength="25" required />
   </div>
  </div>
  <?php if(!isset($_GET['edit'])) { ?>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="password">Password</label>
   </div>
   <div class="col-sm-8">
    <input type="password" name="password" id="password" class="form-control" value="" placeholder="Password" maxlength="25" required/>
   </div>
  </div>
  <?php } ?>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="level">Level Pengguna</label>
   </div>
   <div class="col-sm-8">
    <select name="level" class="form-control" id="level">
     <option value="1" <?= isset($row['level'])?($row['level']==1?'selected':''):'' ?>>Administrator</option>
     <option value="0" <?= isset($row['level'])?($row['level']==0?'selected':''):'' ?>>Operator</option>
    </select>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-12">
    <button type="submit" class="form-control btn btn-login" name="simpan">Simpan</button>
   </div>
  </div>
</form>
<?php
include('footer.php');