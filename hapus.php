<?php
include_once('config/koneksi.php');
if(isset($_SESSION['level'])){
 if($_SESSION['level'] == '1'){
  $query = "delete from ".$_GET['table']." where id = '".$_GET['id']."'";
  if($_GET['table'] == 'faktur'){
   $querydetail = "delete from faktur_detail where id_faktur = '".$_GET['id']."'";
  } 
  if(mysqli_query($kon, $query)){
   if(isset($querydetail)){
    mysqli_query($kon, $querydetail);
   }
   echo "<script>";
   echo "alert('Data berhasil dihapus'); document.location.href='lihat_".$config['redir'][$_GET['table']].".php'";
   echo "</script>";
  } else {
   echo $query;
  }
 }
} 