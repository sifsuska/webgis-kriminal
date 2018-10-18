<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Tambah Data Jumlah Kriminal";
$config['hal_aktif'] = "user";
$jenis_kriminal = $config['jenis_kriminal'];
hak_akses([1],TRUE);
if(isset($_GET['camat'])){
 
 $config['judul_sub_halaman'] = "Ubah Data Jumlah Kriminal";
 $query = mysqli_query($kon, "select * from jumlah_kriminalitas where id_kecamatan='".$_GET['camat']."' and id_tahun='".$_GET['th']."'");
 $row = mysqli_fetch_assoc($query);
} else {
 
 if (isset($_POST['id'])){
  
 if($_POST['id'] === ''){
  
  $toInsert = "";
  foreach($jenis_kriminal as $key=>$val){
   $toInsert .= ", '".$_POST[$key]."'";
  }
  $query = mysqli_query($kon, "insert into jumlah_kriminalitas values('','".$_POST['id_tahun']."','".$_POST['id_kecamatan']."'". $toInsert .")");
  if($query){
   echo "<script>alert('Data berhasil ditambahkan!');\n document.location = 'lihat_kecamatan.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan Penambahan.');\n document.location = 'lihat_kecamatan.php'</script>";
  }
 } else {
  $toInsert = [];
  foreach($jenis_kriminal as $key=>$val){
   $toInsert[] = $key." = '".$_POST[$key]."'";
  }
  $query = mysqli_query($kon,"update jumlah_kriminalitas set ". implode(', ', $toInsert) ." where id='".$_POST['id']."'");
  if($query){
   echo "<script>alert('Data berhasil diperbarui');\n document.location = 'lihat_kecamatan.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan dalam pembaruan data. ');\n document.location = 'lihat_kecamatan.php'</script>";
  }
 }
}
}

include('header.php');
?>
<form method="POST" action="form_jumlah_kriminal.php" name="jumkrim" class="form-horizontal">
 <input type="hidden" name="id" value="<?= isset($row['id'])?$row['id']:'' ?>" />
 <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="tahun">Tahun</label>
   </div>
   <div class="col-sm-8">
    <?= $_GET['th'] ?>
    <input name="id_tahun" type="hidden" value="<?= isset($row['tahun'])?$row['tahun']:$_GET['th'] ?>">
    <input name="id_kecamatan" type="hidden" value="<?= isset($row['id_kecamatan'])?$row['id_kecamatan']:$_GET['camat'] ?>">
   </div>
 </div>
 <?php foreach($jenis_kriminal as $key=>$kasus){ ?>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="<?= $key ?>"><?= $kasus ?></label>
   </div>
   <div class="col-sm-8">
    <input type="number" name="<?= $key ?>" id="<?= $key ?>" class="form-control" value="<?= isset($row[$key])?$row[$key]:'0' ?>" placeholder="<?= $kasus ?>" required />
   </div>
  </div>
 <?php } ?>
  <div class="form-group">
   <div class="col-sm-12">
    <button type="submit" class="form-control btn btn-login" name="simpan">Simpan</button>
   </div>
  </div>
</form>
<?php
include('footer.php');