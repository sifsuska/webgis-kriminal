<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Ubah Password Pengguna";
$config['hal_aktif'] = "user";
if(isset($_POST['id'])){ // PASS 1: ID User ada di Database
  $state = false;
  $id_user = (int)$_POST['id'];
  if($_SESSION['level'] == 1 && $_SESSION['id_user'] != $id_user){
   $query = mysqli_query($kon, "select * from pengguna where id_pengguna='".$_SESSION['id_user']."'");
  } else {
   $query = mysqli_query($kon, "select * from pengguna where id_pengguna='".$id_user."'");
  }
  $userdata = mysqli_fetch_array($query) or die('Gagal');
  if(password_verify($_POST['pass_user'], $userdata['password'])){ // PASS 2: Password Sesuai dengan di Database
   if($_POST['pass_user_new'] === $_POST['pass_user_konfirm']) { // PASS 3: Pengguna telah konfirmasi password barunya
    $pass_user = password_hash($_POST['pass_user_new'], PASSWORD_DEFAULT);
    $query_update = mysqli_query($kon, "update pengguna set password ='".$pass_user."' where id_pengguna='".$id_user."'");
    if($query_update){
     $state = true;
    }
   } 
  }
  $redir = 'lihat_pengguna.php';
  if($_SESSION['level'] != 1){
   $redir = "dash.php";
  }
  if($state){
   echo "<script>alert('Password berhasil diubah'); document.location.href='".$redir."'; </script>";
  } else {
   echo "<script>alert('Password gagal diubah'); document.location.href='".$redir."'; </script>";
  }
}
$id_user = (int)$_GET['id'];
$query = mysqli_query($kon, "select * from pengguna where id_pengguna='".$id_user."'");
$userdata = mysqli_fetch_array($query) or die('Gagal');
include('header.php');
?>
<h3>Ubah Password untuk Pengguna <em><?= $userdata['username'] ?></em></h3>
<form method="POST" action="form_password.php" name="password" class="form-horizontal">
 <input type="hidden" name="id" value="<?= isset($userdata['id'])?$userdata['id']:'' ?>" />
  <div class="form-group">
   <div class="col-sm-4">
   <?php if($_SESSION['level'] == 1 && $_SESSION['id_user'] != $id_user){ ?>
   <label class="control-label" for="pass_user">Password Anda sebagai Administrator</label>
   <?php } else { ?>
   <label class="control-label" for="pass_user">Password Sekarang</label>
   <?php } ?>
   </div>
   <div class="col-sm-8">
    <input type="password" id="pass_user" class="form-control" name="pass_user" value="" placeholder="Password" maxlength="25" required />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="pass_new">Password Baru</label>
   </div>
   <div class="col-sm-8">
    <input type="password" name="pass_user_new" value="" id="pass_new" class="form-control" placeholder="Password Baru" maxlength="25" required />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="pass_konf">Konfirmasi Password Baru</label>
   </div>
   <div class="col-sm-8">
    <input type="password" name="pass_user_konfirm" value="" id="pass_konf" class="form-control" placeholder="Konfirmasi Password Baru" maxlength="25" required />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-12">
    <button type="submit" name="simpan" class="btn btn-login form-control">Simpan</button>
   </div>
  </div>
</form>
<?php
ob_start(); ?>
<script>
 $(document).ready(function() {
  $("#pass_konf").on('change', function() {
   if($("#pass_new").val() !== $("#pass_konf").val()){
    alert('Password yang Anda masukkan tidak sesuai. Pastikan Anda mengingat password baru Anda dan masukkan di kolom "Konfirmasi Password Baru"');
    $("#pass_konf").val("");
    $("#pass_konf").focus();
   }
  })
 });
</script>
<?php
$scr = ob_get_clean();
$vws->set_inline($scr);
include('footer.php');