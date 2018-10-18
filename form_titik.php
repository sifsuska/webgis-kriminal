<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Tambah Data Kriminal";
$config['hal_aktif'] = "kriminal";
$jenis_kriminal = $config['jenis_kriminal'];
hak_akses([1],TRUE);
if(isset($_GET['edit'])){
 $config['judul_sub_halaman'] = "Ubah Data Kriminal";
 $query = mysqli_query($kon, "select * from titik_kriminal where id='".$_GET['edit']."'");
 $row = mysqli_fetch_assoc($query);
} else if (isset($_POST['id'])){
 if($_POST['id'] === ''){
  $query = mysqli_query($kon, "insert into titik_kriminal values('','".$_POST['no_laporan']."','".$_POST['pelapor']."','".$_POST['terlapor']."','".$_POST['tanggal']."','".$_POST['uraian']."','".$_POST['geomet']."','".$_POST['geometlng']."','".$_POST['alamat']."','".$_POST['kecamatan']."','".$_POST['pasal']."','".$_POST['keterangan']."','".$_POST['kategori']."')");
  if($query){
   echo "<script>alert('Data Kriminal berhasil ditambahkan!');\n document.location = 'lihat_titik.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan Penambahan.');\n document.location = 'lihat_titik.php'</script>";
  }
 } else {
  echo "update titik_kriminal set no_laporan='".$_POST['no_laporan']."',pelapor='".$_POST['pelapor']."',terlapor='".$_POST['terlapor']."',tanggal='".$_POST['tanggal']."',uraian='".$_POST['uraian']."',lat='".$_POST['geomet']."',lng='".$_POST['geometlng']."',alamat='".$_POST['alamat']."',kecamatan='".$_POST['kecamatan']."', pasal='".$_POST['pasal']."',keterangan='".$_POST['keterangan']."', kategori='".$_POST['kategori']."' where id='".$_POST['id']."'";
  $query = mysqli_query($kon,"update titik_kriminal set no_laporan='".$_POST['no_laporan']."',pelapor='".$_POST['pelapor']."',terlapor='".$_POST['terlapor']."',tanggal='".$_POST['tanggal']."',uraian='".$_POST['uraian']."',lat='".$_POST['geomet']."',lng='".$_POST['geometlng']."',alamat='".$_POST['alamat']."',kecamatan='".$_POST['kecamatan']."', pasal='".$_POST['pasal']."',keterangan='".$_POST['keterangan']."', kategori='".$_POST['kategori']."' where id='".$_POST['id']."'");
  if($query){
   echo "<script>alert('Data berhasil diperbarui');\n document.location = 'lihat_titik.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan dalam pembaruan data.');\n document.location = 'lihat_titik.php'</script>";
  }
 }
}
$vws->set_inline("<link rel='stylesheet' href='assets/css/leaflet.css'/>");
include('header.php');
$vws->reset_inline();
?>
<form method="POST" action="form_titik.php" name="pengguna" class="form-horizontal">
 <input type="hidden" name="id" value="<?= isset($row['id'])?$row['id']:'' ?>" />
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="no_laporan">Nomor Laporan</label>
   </div>
   <div class="col-sm-8">
    <input type="text" name="no_laporan" id="no_laporan" class="form-control" value="<?= isset($row['no_laporan'])?$row['no_laporan']:'' ?>" placeholder="Nomor Laporan Polisi" maxlength="50" required />
   </div>
  </div>
    <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="pelapor">Pelapor</label>
   </div>
   <div class="col-sm-8">
    <textarea name="pelapor" id="pelapor" class="form-control" placeholder="Keterangan Pelapor" required><?= isset($row['pelapor'])?$row['pelapor']:'' ?></textarea>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="terlapor">Terlapor</label>
   </div>
   <div class="col-sm-8">
    <textarea name="terlapor" id="terlapor" class="form-control" placeholder="Keterangan Terlapor"required><?= isset($row['terlapor'])?$row['terlapor']:'' ?></textarea>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="tanggal">Tanggal Lapor</label>
   </div>
   <div class="col-sm-8">
    <input type="date" name="tanggal" id="tanggal" class="form-control" value="<?= isset($row['tanggal'])?$row['tanggal']:'' ?>" placeholder="Pilih Tanggal" required />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="pasal">Pasal</label>
   </div>
   <div class="col-sm-8">
    <input type="text" name="pasal" id="pasal" class="form-control" value="<?= isset($row['pasal'])?$row['pasal']:'' ?>" placeholder="Pasal" />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="kategori">Kategori</label>
   </div>
   <div class="col-sm-8">
    <select name="kategori" id="kategori" class="form-control">
     <?php foreach($jenis_kriminal as $key=>$value){ ?>
     <option value="<?= $key ?>" <?= isset($row['kategori'])?($row['kategori'] == $key?"selected":""):"" ?>><?= $value ?></option>
     <?php } ?>
    </select>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="uraian">Uraian</label>
   </div>
   <div class="col-sm-8">
    <textarea name="uraian" id="uraian" class="form-control" placeholder="Masukkan uraian singkat kejadian kriminal" required ><?= isset($row['uraian'])?$row['uraian']:'' ?></textarea>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="keterangan">Keterangan</label>
   </div>
   <div class="col-sm-8">
    <input type="text" name="keterangan" id="keterangan" class="form-control" value="<?= isset($row['keterangan'])?$row['keterangan']:'' ?>" placeholder="Keterangan Tambahan" />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="alamat">Alamat</label>
   </div>
   <div class="col-sm-8">
    <textarea name="alamat" id="alamat" class="form-control" placeholder="Masukkan alamat tempat kejadian" required ><?= isset($row['alamat'])?$row['alamat']:'' ?></textarea>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="kecamatan">Kecamatan</label>
   </div>
   <div class="col-sm-8">
    <?php
     $query = mysqli_query($kon, "select id,nama_kecamatan,nama_kota from kecamatan");
     $kecamatan_arr = array();
    ?>
    <select name="kecamatan" class="form-control" id="kecamatan">
     <?php while($camat=mysqli_fetch_assoc($query)) { ?>
     <option value="<?= $camat['id'] ?>" <?= isset($row['kecamatan'])?($row['kecamatan']==$camat['id']?'selected':''):'' ?>>
      <?= $camat['nama_kecamatan']." (".$camat['nama_kota'].")" ?>
     </option>
     <?php 
     $kecamatan_arr[$camat['id']]['nama_kecamatan'] = $camat['nama_kecamatan'];
     $kecamatan_arr[$camat['id']]['kota'] = $camat['nama_kota'];
     } ?>
    </select>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="geomet">Koordinat</label>
   </div>
   <div class="col-sm-8">
    <button type="button" id="geocode" class='btn btn-login'>Cari Koordinat Alamat</button> atau <a href="#petaform" data-toggle="modal" class="btn btn-login">Buka Peta</a><br><br>
    <input type="text" name="geomet" id="geomet" class="form-control" value="<?= isset($row['lat'])?$row['lat']:'' ?>" placeholder="Latitude" required />
    <input type="text" name="geometlng" id="geometlng" class="form-control" value="<?= isset($row['lng'])?$row['lng']:'' ?>" placeholder="Longitude" required />
   </div>
  </div>
  
  <div class="form-group">
   <div class="col-sm-12">
    <button type="submit" class="form-control btn btn-login" name="simpan">Simpan</button>
   </div>
  </div>
</form>
<div id="petaform" class="modal" role="dialog">
 <div class="modal-dialog">
  <div class="panel panel-primary">
   <div class="panel-heading">Pilih Koordinat Peta</div>
   <div class="panel-body">
    <h5 style="margin:0;text-align: center">Koordinat Terpilih: <span id="koord"></span></h5>
    <div id="map" style="height: 500px"></div>
   </div>
   <div class="panel-footer">
    <button class="btn btn-primary" data-dismiss="modal">Selesai</button>
   </div>
  </div> 
 </div>
</div>
<?php
ob_start();
?>
<script src="assets/js/leaflet.js"></script>
        <!--/ custom javascripts -->
<script>
<?php 
echo "var currentLatLng = [".(isset($row['lat'])?$row['lat'].",".$row['lng']:'0,0')."]; \n";
echo "var kecamatan_id = ".json_encode($kecamatan_arr)."; \n";
?>
var address = '';
var kecamatanColors = {
  "Lubuk Sikarah": "rgba(210,199,72,1.0)",
  "Tanjung Harapan": "rgba(130,233,209,1.0)",
  "Junjung Sirih": "rgba(46,187,230,1.0)",
  "X Koto Singkarak": "rgba(132,116,220,1.0)",
  "X Koto Diatas": "rgba(218,63,63,1.0)",
  "Bukit Sundi": "rgba(107,214,139,1.0)",
 };

 /** fungsi untuk style kelurahan dikategorikan ke kecamatan
  */
 function style_kelurahan(feature) {
  return {
   opacity: 1,
   color: kecamatanColors[feature.properties['kecamatan']],
   dashArray: '',
   lineCap: 'butt',
   lineJoin: 'miter',
   weight: 2.0,
   fillOpacity: 0.3,
   fillColors: kecamatanColors[feature.properties['kecamatan']],
  };
 }
 
 var pekanbaru = L.geoJson(null, {
   style: style_kelurahan,
   onEachFeature: function (feature, layer) {
    //layer.bindPopup("<strong>"+feature.properties.kecamatan+"</strong>");
    layer.on('click', function() {
     markerForm.setLatLng([lat,lng]).addTo(map);
     $("#koord").text(lat+" ,"+lng);
     $("#geomet").val(lat);
     $("#geometlng").val(lng);
     $("#kecamatan").val(feature.properties.id);
    });
  }
  });
 $.getJSON("camat-geojson.php", function (data) {
  pekanbaru.addData(data);
 });
var osm = L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
   maxZoom: 20,
   subdomains: ['a' , 'b' , 'c'],
   attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>" '
   });
var map = L.map("map", {
   zoom: 11,
   center: [-0.73568, 100.613452],
   layers: [osm, pekanbaru],
   zoomControl: false,
   attributionControl: true
  });
markerForm = L.marker(currentLatLng).addTo(map);
$("#koord").text(currentLatLng[0]+" ,"+currentLatLng[1]);
map.on("click", function(ev) {
 console.log(lat+" "+lng);
});
map.on("mousedown", function (ev) {
	lat = ev.latlng.lat;
	lng = ev.latlng.lng;
});
$('#petaform').on('shown.bs.modal', function(){
  map.invalidateSize();
 });
$("#geocode").on('click', function() {
 address = $("#alamat").val() + ", " + kecamatan_id[$("#kecamatan").val()]['nama_kecamatan'] + ", " + kecamatan_id[$("#kecamatan").val()]['kota'];
 $.ajax({
  dataType: "json",
  async: false,
  url:'https://maps.googleapis.com/maps/api/geocode/json',
  data:{
   'address': address,
   'key': 'AIzaSyA2uR58x5F61hqOWQgLTaks1OUY9hz1pZM'
  }, 
  success:function (res, status) {
   console.log(res);
   if (res.status === 'OK') {
    _results = res;
    hasil = {
     'lat': res.results[0].geometry.location.lat,
     'lng': res.results[0].geometry.location.lng
    };
    markerForm.setLatLng([hasil['lat'], hasil['lng']]).addTo(map);
    //console.log($(this_sel+">td>#lat").find("#lat"));
    console.log(Date() + " : AJAX diinputkan");
    $("#koord").text(hasil.lat+" ,"+hasil.lng);
    $("#geomet").val(hasil.lat);
    $("#geometlng").val(hasil.lng);
   } else {
    console.log(address);
    alert('Pencarian tidak berhasil. Kode Error: ' + res.status);
   }
  }
 });
})
</script>
<?php
$vws->set_inline(ob_get_clean());
include('footer.php');