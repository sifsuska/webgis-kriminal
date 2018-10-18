<?php
include_once('config/koneksi.php');
header('Content-Type: text/json');
$search = $_GET['query'];
$query = mysqli_query($kon, "SELECT * FROM `titik_kriminal` where no_laporan like '%".$search."%'");

$data = [
 'status' => (mysqli_num_rows($query) == 0)?"ZERO_RESULTS":"OK",
 'results' => array()
];

while($row=mysqli_fetch_assoc($query)){
 $data['results'][$row['id']] = $row;
}

echo json_encode($data, JSON_PRETTY_PRINT);
