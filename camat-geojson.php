<?php
header('Content-Type: text/json');
include('config/koneksi.php');
/* $gini = file_get_contents('polres-solok-kota2.geojson');
$res = json_decode($gini);
foreach($res->features as $ft){
 mysqli_query($kon, "insert into kecamatan values('','".$ft->properties->KECAMATAN."','".$ft->properties->KABUPATEN."','".json_encode($ft->geometry->coordinates)."')");
} */
$geojson = array(
 'type' => "FeatureCollection",
 'crs' => array(
  'type' => 'name',
  'properties' => array(
   'name' => 'urn:ogc:def:crs:OGC:1.3:CRS84'
  )
 ),
 'features' => array()
);
$query = mysqli_query($kon, "select * from kecamatan");
while($row=mysqli_fetch_assoc($query)){
 $geojson['features'][] = array(
  'type' => 'Feature',
  'properties' => array(
   'id' => $row['id'],
   'kecamatan' => $row['nama_kecamatan'],
   'kota' => $row['nama_kota']
  ),
  'geometry' =>  array(
   'type' => 'Polygon',
   'coordinates' => json_decode($row['geometry'])
  )
 );
}

echo json_encode($geojson);