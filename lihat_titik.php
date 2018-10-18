<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Kelola Data Kriminal";
$config['hal_aktif'] = "kriminal";
hak_akses([1],TRUE);
ob_start();
?>
<link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
<link href="assets/css/jquery.dataTables_themeroller.min.css" rel="stylesheet"/>
<?php
$vws->set_inline(ob_get_clean());
include('header.php');
$vws->reset_inline();
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
<h4 class="print-only" style="text-align:center">Daftar Laporan Polisi Pada SATRESKRIM TH <?= date('Y') ?></h4>
<div class="col-sm-12">

 <div class="btn-group hidden-print" style="margin:25px 5px">
  <a href="form_titik.php" class="btn btn-primary btn-md"><span class="fa fa-plus"></span> Tambah Data Kriminal</a>
  <a href="laporan_pdf.php" class="btn btn-primary btn-md"><span class="fa fa-file-pdf-o"></span> Unduh Laporan</a>
 </div>

 <table class="table table-striped table-bordered table-responsive" id="kriminal">
  <thead>
   <tr>
    <th>Laporan Polisi</th>
    <th>Pelapor</th>
    <th>Terlapor</th>
    <th>Pasal</th>
    <th>Uraian</th>
    <th>Ket</th>
    <th class="hidden-print">Aksi</th>
   </tr>
  </thead>
  <tbody>
   <?php 
   $query = mysqli_query($kon, "select * from titik_kriminal");
   if(mysqli_num_rows($query) !== 0){
    while($row=mysqli_fetch_assoc($query)){ ?>
    <tr>
     <td><?= $row['no_laporan'] ?><br>
     <?= tanggal($row['tanggal']) ?></td>
     <td><?= $row['pelapor'] ?></td>
     <td><?= $row['terlapor'] ?></td>
     <td><?= $row['pasal'] ?></td>
     <td><?= $row['uraian'] ?></td>
     <td><?= $row['keterangan'] ?></td>
     <td class="hidden-print"><a href="form_titik.php?edit=<?= $row['id'] ?>"><span class="fa fa-pencil"></span> Ubah</a> | <a href="hapus.php?table=titik_kriminal&id=<?= $row['id'] ?>" onclick="return confirm('Hapus data ini?');"><span class="fa fa-close"></span> Hapus</a>
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
ob_start();
?>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap.min.js"></script>
<script src="assets/js/dataTables.buttons.min.js"></script>
<script src="assets/js/buttons.print.min.js"></script>
<script>
 $(document).ready(function() {
  $("#kriminal").DataTable();
 });
</script>
<?php
$vws->set_inline(ob_get_clean());
include('footer.php');