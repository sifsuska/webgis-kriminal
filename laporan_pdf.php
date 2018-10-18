<?php 
include_once('config/koneksi.php');
ob_start(); ?>
<page backtop="50px" backbottom="20px" backleft="1px" backright="1px">
 <bookmark title="Laporan Kriminal Polres Solok Kota" level="0"></bookmark>
 <page_header>
 <table style="width:100%">
  <tr>
   <td style="width:90%">
    <strong>Kepolisian Negara Republik Indonesia
    <br>Daerah Sumatera Barat
    <br>Resor Solok Kota</strong>
   </td>
  </tr>
  <tr>
   <td><hr style="border:solid 1px #000"/></td>
  </tr>
 </table>
 </page_header>
 <div style="width:100%;padding-left:10px">
 <h4 style="line-height:1;text-align:center">DAFTAR LAPORAN POLISI PADA SAT RESKRIM TH <?= date('Y') ?></h4>
 <table cellspacing="0" style="width:90%;margin:auto" border="1">
  <thead>
   <tr>
    <th>No</th>
    <th>Laporan Polisi</th>
    <th>Pelapor</th>
    <th>Terlapor</th>
    <th>Pasal</th>
    <th>Uraian</th>
    <th>Ket</th>
   </tr>
  </thead>
  <tbody>
   <?php 
   $c = 1; 
   $query = mysqli_query($kon, "select * from titik_kriminal");
   if(mysqli_num_rows($query) !== 0){
    while($row=mysqli_fetch_assoc($query)){ 
    if(($c-1) % 10 == 0) { // limit page content to 10
     if($c != 1){ 
    ?>
  </table>
  </div>
  </page>
  <page backtop="50px" backbottom="20px" backleft="1px" backright="1px">
  <div style="width:100%;padding-left:10px">
   <table cellspacing="0" style="width:90%;margin:auto" border="1">
    <thead>
     <tr>
      <th>No</th>
      <th>Laporan Polisi</th>
      <th>Pelapor</th>
      <th>Terlapor</th>
      <th>Pasal</th>
      <th>Uraian</th>
      <th>Ket</th>
     </tr>
    </thead>
    <tbody>
    <?php }  } ?>
    <tr style="text-align:center" nobr="true">
     <td style="padding:5px"><?= $c++ ?></td>
     <td style="width:17%;padding:5px"><?= $row['no_laporan'] ?><br>
     <?= tanggal($row['tanggal']) ?></td>
     <td style="width:20%;padding:5px"><?= $row['pelapor'] ?></td>
     <td style="width:20%;padding:5px"><?= $row['terlapor'] ?></td>
     <td style="width:10%;padding:5px"><?= $row['pasal'] ?></td>
     <td style="width:25%;padding:5px"><?= $row['uraian'] ?></td>
     <td style="width:10%;padding:5px"><?= $row['keterangan'] ?></td>
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
</page>
<?php
//require_once 'vendor/autoload.php';
 $html = ob_get_clean();
 $html2pdf = new \Spipu\Html2Pdf\Html2Pdf('L', 'Legal', 'en',true,'UTF-8',array(5,5,5,8));
 $html2pdf->pdf->SetAuthor('POLRES Solok Kota');
 $html2pdf->pdf->SetTitle('Laporan Kriminal Polres Solok Kota');
 $html2pdf->writeHTML($html);
 $html2pdf->output('laporan.pdf','D');
?>