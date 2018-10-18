<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Kelola Data Jumlah Kriminal";
$config['hal_aktif'] = "kriminal";
hak_akses([1],TRUE);
include('header.php');
$field = ['curat_363', 'curi_ternak_363', 'curanmor_363', 'curi_biasa_362', 'jambret', 'curas_365', 'curi_dlm_keluarga', 'pembakaran', 'kebakaran', 'aborsi', 'pembunuhan', 'pengeroyokan', 'perjudian', 'ket_palsu', 'surat_palsu', 'aniaya_ringan', 'aniaya_berat', 'penggelapan', 'pemerasan', 'penipuan', 'hipnotis', 'penghinaan', 'pengancaman', 'pengrusakan', 'perbuatan_tdk_menyenangkan', 'kdrt', 'pemerkosaan', 'pencabulan', 'bawa_lari_perempuan', 'setubuh_anak_bawah_umur', 'perlindungan_anak'];
$query_tahun = mysqli_query($kon, "select * from jumlah_kriminalitas");
$arrcamat = array();
while($row = mysqli_fetch_assoc($query_tahun)){
 $jumlah_krim = 0;
 foreach($field as $fd){
  $jumlah_krim += $row[$fd];
 }
 $arrcamat[$row['id_kecamatan']][$row['id_tahun']] = array('id'=>$row['id'], 'total_krim'=> $jumlah_krim);
}

?>
<style>
 hr{
  border: 1px solid #7a7a7a;
  margin: 5px;
 }
 .print-only { display: none }
 @media print{
  nav, #content-title, .hidden-print { display: none }
  .print-only { display: block }
 }
</style>
<div class="col-sm-12">
 <table class="table table-striped table-bordered table-responsive">
  <thead>
   <tr>
    <th rowspan="2">Kecamatan</th>
    <th colspan="6" class="text-center">Tahun</th>
   </tr>
   <tr>
    <?php foreach(range(2013,date('Y')) as $th) { ?>
    <th><?= $th ?></th>
    <?php } ?>
   </tr>
  </thead>
  <tbody>
   <?php
   $query = mysqli_query($kon, "select id,nama_kecamatan,nama_kota from kecamatan");
   if(mysqli_num_rows($query) !== 0){
    while($row=mysqli_fetch_assoc($query)){ ?>
    <tr>
     <td><?= $row['nama_kecamatan'] ?><br>
     (<?= $row['nama_kota'] ?>)</td>
     <?php foreach(range(2013,date('Y')) as $th) { ?>
     <td><?= isset($arrcamat[$row['id']][$th])?"<a href='form_jumlah_kriminal.php?camat=".$row['id']."&th=".$th."' title='Edit Jumlah'>".$arrcamat[$row['id']][$th]['total_krim']."</a>":"<a href='form_jumlah_kriminal.php?camat=".$row['id']."&th=".$th."' title='Edit Jumlah'><em>(belum ada data)</em></a>" ?></td>
     <?php } ?>
    </tr>
    <?php }
    } else {
     ?>
     <tr>
      <td colspan="5">Tidak Ada Data</td>
     </tr>
    <?php } ?>
  </tbody>
 </table>
</div>
<?php
include('footer.php');