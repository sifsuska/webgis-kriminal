<?php
error_reporting(0);
include_once('config/koneksi.php');
header('Content-Type: text/json');
$query = mysqli_query($kon, "SELECT * FROM `jumlah_kriminalitas` group by id");
$field = ['curat_363', 'curi_ternak_363', 'curanmor_363', 'curi_biasa_362', 'jambret', 'curas_365', 'curi_dlm_keluarga', 'pembakaran', 'kebakaran', 'aborsi', 'pembunuhan', 'pengeroyokan', 'perjudian', 'ket_palsu', 'surat_palsu', 'aniaya_ringan', 'aniaya_berat', 'penggelapan', 'pemerasan', 'penipuan', 'hipnotis', 'penghinaan', 'pengancaman', 'pengrusakan', 'perbuatan_tdk_menyenangkan', 'kdrt', 'pemerkosaan', 'pencabulan', 'bawa_lari_perempuan', 'setubuh_anak_bawah_umur', 'perlindungan_anak'];
$data = [];
$total_tahunan = [];
while($row=mysqli_fetch_assoc($query)){
 foreach(range(2013,date('Y')) as $tahun){
  if(!isset($data[$row['id_kecamatan']][$tahun])){
   foreach($field as $col){
    $data[$row['id_kecamatan']][$tahun][$col] = 0;
   }
  }
 }
 foreach($field as $col){
  $data[$row['id_kecamatan']][$row['id_tahun']][$col] = $row[$col];
 }
 /* $total_pertahun = array_sum($data[$row['id_kecamatan']][$row['id_tahun']]);
 $data[$row['id_kecamatan']][$row['id_tahun']]['total_krim'] = $total_pertahun;
 $total_tahunan[$row['id_tahun']] = isset($total_tahunan[$row['id_tahun']])?$total_tahunan[$row['id_tahun']] + $total_pertahun:$total_pertahun; */
}
$query = mysqli_query($kon, "SELECT year(tanggal) as tahun,kecamatan,kategori,count(kategori) as jumlah FROM `titik_kriminal` group by tahun,kecamatan,kategori");
while($row=mysqli_fetch_assoc($query)){
 foreach($field as $col){
  $data[$row['kecamatan']][$row['tahun']][$col] = ($row['kategori'] == $col)?$row['jumlah']:($data[$row['kecamatan']][$row['tahun']][$col]!==0?$data[$row['kecamatan']][$row['tahun']][$col]:0);
 }
}
foreach($data as $key_camat=>$camat){
 foreach($camat as $key_tahun=>$tahun){
  $total_pertahun = array_sum($data[$key_camat][$key_tahun]);
  $data[$key_camat][$key_tahun]['total_krim'] = $total_pertahun;
  $total_tahunan[$key_tahun] = isset($total_tahunan[$key_tahun])?$total_tahunan[$key_tahun] + $total_pertahun:$total_pertahun;
 }
}
 
foreach($data as $key_camat=>$camat){
 foreach($camat as $key_th=>$th){
  $data[$key_camat][$key_th]['persentase'] = ( $total_tahunan[$key_th] !== 0) ? number_format(($data[$key_camat][$key_th]['total_krim'] / $total_tahunan[$key_th] * 100),2) : 0;
 }
}
echo json_encode($data, JSON_PRETTY_PRINT);
