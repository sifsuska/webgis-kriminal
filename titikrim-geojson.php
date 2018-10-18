<?php
header('Content-Type: text/json');
include('config/koneksi.php');
/*$gini = file_get_contents('polres-solok-kota.geojson');
$res = json_decode($gini);
foreach($res->features as $ft){
 mysqli_query($kon, "insert into kecamatan values('','".$ft->properties->kecamatan."','".$ft->properties->kota."','".json_encode($ft->geometry->coordinates)."')");
}*/
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
$query = mysqli_query($kon, "select titik_kriminal.id, no_laporan, tanggal, uraian, lat,lng,alamat,kecamatan.nama_kecamatan,kecamatan.nama_kota,titik_kriminal.kategori from titik_kriminal,kecamatan where titik_kriminal.kecamatan = kecamatan.id");
while($row=mysqli_fetch_assoc($query)){
 $geojson['features'][] = array(
  'type' => 'Feature',
  'properties' => $row,
  'geometry' =>  array(
   'type' => 'Point',
   'coordinates' => [$row['lng'],$row['lat']]
  )
 );
}

echo json_encode($geojson);