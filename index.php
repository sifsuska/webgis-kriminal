<?php
include('config/koneksi.php');
$vws->set_inline("<link rel='stylesheet' href='assets/css/leaflet.css'/>");
$vws->set_inline("<link rel='stylesheet' href='assets/css/MarkerCluster.css'/>");
$vws->set_inline("<link rel='stylesheet' href='assets/css/MarkerCluster.Default.css'/>");
include('front_header.php');
$vws->reset_inline();
?>
<style>
.icoleg{
 margin:5px auto;
 padding:5px;
 text-align:center;
 color:#fff;
}
#hasil_cari button.list-group-item{
 color: #333;
}

#hasil_cari button.list-group-item:focus, #hasil_cari button.list-group-item:hover {
 background-color: #ffedaa;
}

#btnSidebarCollapse{
 background-color: #333;
 color: #ffc900;
}
body{
 overflow:hidden;
}
</style>
    <div id="container">
     <button type="button" class="btn" id="btnSidebarCollapse"><i class="fa fa-search"></i></button>
     <nav id="sidebar" class="active">
      <div id="sidebar-header">
        <div id="carikasus_bar">
         <h3>Pencarian Kasus</h3>
         <form name="kasus" id="carikasus">
          <input type="text" class="form-control" name="query" placeholder="Masukkan Nomor Kasus" style="height: 35px;padding-right: 30px;display: inline" /><button type="submit" class="btn btn-info" style="margin-left: -35px; margin-top: -3px;width: 30px; height: 30px" id="btn-cari"><span class="fa fa-search" style="margin:-3px"> </span></button>
         </form>
        </div>
      </div>
      
      <ul class="list-group" id="hasil_cari" style="height:60vh;max-height:60vh; overflow-y:scroll">
      </ul>
      
      
      <span class="credit" style="text-align:center;display:block;margin: 0 auto;color:#fff">&copy; 2018 Polres Solok Kota</span>
     </nav>
     
     <div id="map"></div>
    </div>
    <hr />
<?php 
ob_start();
?>
<div class="container modal fade" id="detail-kriminal" role="dialog">
 <div class="modal-content" style="margin-top: 10vh">
  <div class="modal-header">
   <h3>Detail Kriminal pada <span id="kecamatan_title"></span> Tahun <span id="tahun_title"></span></h3>
  </div>
  <div class="modal-body" style="max-height:50vh; overflow-y: scroll">
   <div class="row">
    <div class="col-sm-4">
     <table class="table table-striped table-bordered table-reponsive" id="tabel-detail-kriminal">
      <thead>
       <tr>
        <th>Jenis Kriminal</th>
        <th>Jumlah</th>
       </tr>
      </thead>
      <tbody>
      </tbody>
     </table>
    </div>
    <div class="col-sm-8">
     <canvas id="piekriminal" ></canvas>
    </div>
   </div>
  </div>
  <div class="modal-footer">
   <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="fa fa-close"></span> Tutup</button>
  </div>
 </div>
</div>
<script src="assets/js/leaflet.js"></script>
<script src="assets/js/leaflet.markercluster.js"></script>
<script src="assets/js/list.min.js"></script>
<script src="assets/js/typeahead.bundle.min.js"></script>
<script src="assets/js/handlebars.min.js"></script>
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/Chart.bundle.min.js"></script>
<!--/ custom javascripts -->
<script>
function sidebarClick(elem) {
  console.log("hay");
  map.setView([$(elem).attr('lat'), $(elem).attr('lng')], 17);
  layer = markerClusters.getLayer($(elem).data('id'));
  layer.fire('click');
}
var krimtx = document.getElementById("piekriminal").getContext("2d");
$.getJSON("jumlah_kriminal.php", function (data) {
  jumlah_kriminal = data;
});
var currentSelectedKriminal = [];
var jenis_kriminal = {
 "curat_363": "Curat / 363 KUHP"
 , "curi_ternak_363": "Curi Ternak / 363 KUHP"
 , "curanmor_363" : "Curanmor / 363 KUHP"
 , "curi_biasa_362": "Pencurian Biasa / 363 KUHP"
 , "jambret" : "Jambret"
 , "curas_365": "Curas / 365 KUHP"
 , "curi_dlm_keluarga": "Pencurian Dalam Keluarga"
 , "pembakaran": "Pembakaran"
 , "kebakaran": "Kebakaran"
 , "aborsi": "Aborsi"
 , "pembunuhan": "Pembunuhan"
 , "pengeroyokan": "Pengeroyokan"
 , "perjudian": "Perjudian"
 , "ket_palsu": "Keterangan Palsu"
 , "surat_palsu": "Pemalsuan Surat"
 , "aniaya_ringan": "Penganiayaan Ringan"
 , "aniaya_berat": "Penganiayaan Berat"
 , "penggelapan": "Penggelapan"
 , "pemerasan": "Pemerasan"
 , "penipuan":"Penipuan"
 , "hipnotis": "Hipnotis"
 , "penghinaan":"Penghinaan"
 , "pengancaman":"Pengancaman"
 , "pengrusakan":"Pengerusakan"
 , "perbuatan_tdk_menyenangkan": "Perbuatan Tidak Menyenangkan"
 , "kdrt": "KDRT"
 , "pemerkosaan": "Pemerkosaan"
 , "pencabulan": "Pencabulan"
 , "bawa_lari_perempuan": "Bawa Lari Perempuan"
 , "setubuh_anak_bawah_umur": "Menyetubuhi Anak Dibawah Umur"
 , "perlindungan_anak": "Perlindungan Anak"
};
var chartColor = ['#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a','#ffcb4f', '#00be70', '#295ea4', '#fa5a5a',]
var persentase_data = {
 labels: Object.values(jenis_kriminal),
 datasets: [{
  data: [],
  backgroundColor: chartColor,
  label: "Jumlah Kriminalitas"
 }]
};
var options_chart = {
 type: 'pie',
 data: persentase_data,
 options: {
    responsive: true,
    legend:{
      position: 'bottom'
    },
    title:{
      display: true,
      text: "Jumlah Kriminalitas"
    }
  }
};
function parseResult(json_res){
 htmlToAppend = "";
 if(json_res.status == "OK"){
  Object.keys(json_res.results).forEach(function(e) {
   htmlToAppend += "<button data-id='"+listKriminal[e].id+"' lat='"+listKriminal[e].lat+"' lng='"+listKriminal[e].lng+"' class='list-group-item hasilcari_item' onclick='sidebarClick(this)'>"+json_res.results[e].no_laporan+"</button>";
  });
 }
 return htmlToAppend;
}
</script>
<script>
 
 var lat, lng, listKriminal = [], currentSelectedYear;
 $(document).on("click", ".feature-row", function (e) {
  $(document).off("mouseout", ".feature-row", clearHighlight);
  sidebarClick(parseInt($(this).attr("id"), 10));
 });
 function warnaChloro(nilai){
  warna = "rgba(241,227,58,1)";
  if(nilai > 150){
   warna = "rgba(241,58,58,1)"
  } else if(nilai > 50) {
   warna = "rgba(241,142,58,1)"
  }
  return warna
 }
 
 function clearHighlight() {
  highlight.clearLayers();
 }
 
 function syncSidebar(){
  
 }
 var kecamatanColors = {
  "Lubuk Sikarah": "rgba(210,199,72,1.0)",
  "Tanjung Harapan": "rgba(130,233,209,1.0)",
  "Junjung Sirih": "rgba(46,187,230,1.0)",
  "X Koto Singkarak": "rgba(132,116,220,1.0)",
  "X Koto Diatas": "rgba(218,63,63,1.0)",
  "Bukit Sundi": "rgba(107,214,139,1.0)",
 };
 var clusterColor = {
  "sedang": "rgb(255, 159, 64)",
  "tinggi": "rgb(255, 99, 132)",
  "rendah": "rgba(110, 204, 57)",
 };
 
 function style_cluster(feature) {
  persentase = feature.properties.jumlah_kriminal[currentSelectedYear].total_krim;
  var cluster = "rendah";
  if(persentase > 70){
   cluster = "tinggi";
  } else if(persentase > 35) {
   cluster = "sedang";
  }
  return {
   fillColor: clusterColor[cluster]
  };
 }

 /** fungsi untuk style kelurahan dikategorikan ke kecamatan
  */
 function style_kelurahan(feature) {
  return {
   opacity: 1,
   color: 'rgba(0,0,0,0.1)',
   dashArray: '',
   lineCap: 'butt',
   lineJoin: 'miter',
   weight: 1.0,
   fillOpacity: 0.5,
   fillColor: kecamatanColors[feature.properties['kecamatan']]
  };
 }
 
 function syncKriminalIcon(){
  Object.keys(markerKriminal._layers).forEach(function(id) {
   thisMarker = markerKriminal._layers[id].feature.properties;
   isSelected = Object.values(currentSelectedKriminal).find(function(el) {return el == thisMarker.kategori});
   if(typeof isSelected === 'undefined'){
    $(markerKriminal._layers[id].getElement()).addClass('hidden');
   } else {
    $(markerKriminal._layers[id].getElement()).removeClass('hidden');
   }
  });
 }
 
 var solok = L.geoJson(null, {
   style: style_kelurahan,
   onEachFeature: function (feature, layer) {
    layer.bindPopup("<strong>"+feature.properties['kecamatan']+"</strong>");
    feature.properties.jumlah_kriminal = (feature.properties.kota == 'Kota Solok')? jumlah_kriminal['6']:jumlah_kriminal[feature.properties.id];
    layer.on({
     click: function(e) {
      $("#kecamatan_title").text((feature.properties.kota == 'Kota Solok')?"Kota Solok":"Kecamatan "+feature.properties.kecamatan);
      $("#tahun_title").text(currentSelectedYear);
      htmlToAppend = "";
      
      Object.keys(jenis_kriminal).forEach(function(key) {
       htmlToAppend += "<tr>";
       htmlToAppend += "<td>"+jenis_kriminal[key]+"</td>";
       htmlToAppend += "<td>"+feature.properties.jumlah_kriminal[currentSelectedYear][key]+"</td>";
      });
      htmlToAppend += "<tr><th>Jumlah Kejadian Kriminal</th><th>"+feature.properties.jumlah_kriminal[currentSelectedYear].total_krim+"</th></tr>";
      htmlToAppend += "<tr><th>Persentase dari seluruh sektor</th><th>"+feature.properties.jumlah_kriminal[currentSelectedYear].persentase+"%</th></tr>";
      $("#tabel-detail-kriminal>tbody").html(htmlToAppend);
      var chart_data = [];
      Object.keys(jenis_kriminal).forEach(function(key) {
       chart_data.push(feature.properties.jumlah_kriminal[currentSelectedYear][key]);
      });
      persentase_data.datasets[0].data = chart_data;
      if(typeof window.myPie !== "undefined"){
       myPie.clear();
       myPie.destroy();
      }
      window.myPie = new Chart(krimtx, options_chart);
      $("#detail-kriminal").modal('show');
     }
    });
    //jumlah_kriminal[feature.properties.id]['layer_id'] = L.stamp(layer);
    //jumlah_kriminal[feature.properties.id]['layer_id'] = L.stamp(layer);
  }
  });
 $.getJSON("camat-geojson.php", function (data) {
  solok.addData(data);
 });
 
 var markerClusters = new L.MarkerClusterGroup({
  spiderfyOnMaxZoom: true,
  showCoverageOnHover: false,
  zoomToBoundsOnClick: true,
  disableClusteringAtZoom: 16
 });
 var markerKriminalLayer = L.geoJson(null);
 var markerKriminal = L.geoJson(null, {
  pointToLayer: function (feature, latlng) {
   return L.marker(latlng, {
    icon: L.icon({
					iconUrl: (feature.properties.kategori !== '') ?"assets/images/ico/"+feature.properties.kategori+".png":"assets/images/marker-icon.png",
					iconSize: (feature.properties.kategori !== '') ?[28,26]:[24,28],
					iconAnchor: [12, 28],
					popupAnchor: [0, -25]
				}),
    title: feature.properties.no_putusan,
    riseOnHover: true
   });
  },
  onEachFeature: function (feature, layer) {
   listKriminal[feature.properties.id] = {
     name: feature.properties.no_laporan,
					address: feature.properties.alamat + ", "+ feature.properties.nama_kecamatan + ", " + feature.properties.nama_kota,
					source: "Kriminal",
					id: L.stamp(layer),
					lat: feature.geometry.coordinates[1],
					lng: feature.geometry.coordinates[0]
   };
   layer.bindPopup("<strong>"+feature.properties.no_laporan+"</strong><br><span class='fa fa-map-marker'></span>: "+feature.properties.alamat+"<br><em>"+jenis_kriminal[feature.properties.kategori]+"</em>");
  }
 });
 $.getJSON("titikrim-geojson.php", function (data) {
  markerKriminal.addData(data);
  map.addLayer(markerKriminalLayer);
 });
 
 
 var googleStreets = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',{
     maxZoom: 20,
     subdomains:['mt0','mt1','mt2','mt3']
 });

 var osm = L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
   maxZoom: 20,
   subdomains: ['a' , 'b' , 'c'],
   attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>" '
   });
 var markerClusters = new L.MarkerClusterGroup({
  spiderfyOnMaxZoom: true,
  showCoverageOnHover: true,
  zoomToBoundsOnClick: true,
  disableClusteringAtZoom: 16
 });
 var map = L.map("map", {
   zoom: 10,
   center: [-0.73568, 100.613452],
   layers: [osm, solok, markerClusters],
   zoomControl: false,
   attributionControl: true
  });
  
  map.on("overlayadd", function (e) {
    markerClusters.addLayer(markerKriminal);
    syncSidebar();
  });

  map.on("overlayremove", function (e) {
    markerClusters.removeLayer(markerKriminal);
    syncSidebar();
  });
  
  map.on("zoomend", function(e) {
   syncKriminalIcon();
  });
  
  markerClusters.on('animationend', function(e) {
   syncKriminalIcon();
  });
  
  L.Control.Legend = L.Control.extend({
   onAdd: function(map){
    var divlegend = L.DomUtil.create('div','hidden');
    divlegend.id = "legenda";
    divlegend.style = "min-width:100px;min-height:80px;background-color:#fff;padding:20px;border-radius:5px";
    divlegend.innerHTML = "<strong>Jumlah Kasus Kriminal Per Kecamatan</strong><div class='icoleg' style='color:#444;background-color:rgba(241,58,58,.5)'>>150</div><div class='icoleg' style='color:#444;background-color:rgba(241,142,58,.5)'>50-150</div><div class='icoleg' style='color:#444;background-color:rgba(110, 204, 57, .6)'>0-50</div>";
    L.DomEvent.disableClickPropagation(divlegend);
    return divlegend;
   }
  });
  
  L.control.legend = function(opts){
   return new L.Control.Legend(opts);
  }
  
  L.control.legend({position: 'bottomleft'}).addTo(map);
  
  L.Control.Cari = L.Control.extend({
   onAdd: function(map){
    var divlegend = L.DomUtil.create('div','kotakalat');
    divlegend.style = "min-width:200px;min-height:150px;background-color:#fff;padding:20px;border-radius:5px";
    divlegend.innerHTML = "<button class='btn btn-default btn-toolbox' id='layerjumlah'><strong><span class='fa fa-bar-chart'></span> Lihat Jumlah Kriminal</button><br>";
    divlegend.innerHTML += "<div class='hidden' id='alattahun'><strong>Pilih tahun</strong><br><select name='tahun' id='tahunlayer' class='form-control'> <option selected disabled>Pilih Tahun</option><option value='2013'>2013</option><option value='2014'>2014</option><option value='2015'>2015</option><option value='2016'>2016</option><option value='2017'>2017</option><option value='2018'>2018</option></select>";
    L.DomEvent.disableClickPropagation(divlegend);
    return divlegend;
   }
  });
  L.control.cari = function(opts){
   return new L.Control.Cari(opts);
  }
  L.control.cari({position: 'bottomright'}).addTo(map);
  
  L.Control.Title = L.Control.extend({
   onAdd: function(map){
    var divlegend = L.DomUtil.create('div','kotaktahun');
    divlegend.style = "background-color:rgba(255,255,255,1);padding:10px;min-width: 300px";
    divlegend.innerHTML = "<h4 class='pull-left'>Jenis Kriminal</h4><button type='button' class='btn btn-md btn-primary pull-right' data-toggle='collapse' data-target='#pilihjenis_list'><span class='fa fa-chevron-down'><span></button><br>";
    divlegend.innerHTML += '<form name="pilihjenis" id="pilihjenis" class="pull-left">'
    +'<ul class="collapse list-group" id="pilihjenis_list" style="height:60vh;max-height:60vh; overflow-y:scroll; color: #5a5a5a">'
     <?php foreach($config['jenis_kriminal'] as $key=>$val){ ?>
     +'<li class="list-group-item">'
     +'<input type="checkbox" name="jenis_krim" id="jenis_<?= $key ?>" value="<?= $key ?>" checked />&nbsp;&nbsp;<label for="jenis_<?= $key ?>"><img src="assets/images/ico/<?= $key ?>.png" class="img " style="max-width: 15px" /><?= $val ?></label><br>'
     +'</li>'
     <?php } ?>
    +'</ul></form>';
    L.DomEvent.disableClickPropagation(divlegend);
    L.DomEvent.disableScrollPropagation(divlegend);
    return divlegend;
   }
  });
  L.control.title = function(opts){
   return new L.Control.Title(opts);
  }
  L.control.title({position: 'topleft'}).addTo(map);
  
  var baseLayers = {
   "Open Street Map": osm,
   "Google Streets": googleStreets,
  };
  var overLayers = {
    "<img src='assets/css/images/marker-icon.png' width=15 height=22 /> Titik Kriminal": markerKriminalLayer
  }
  if (document.body.clientWidth <= 767) {
   var isCollapsed = true;
  } else {
   var isCollapsed = false;
  }
  var layerControl = L.control.layers(baseLayers,overLayers, {
    collapsed: isCollapsed
  }).addTo(map);
   
  $(document).one("ajaxStop", function () {
  });
   
</script>
<script>
 
</script>
<script>
currentViewState = 0;
$(document).ready(function() {
  selectedVal = $("#pilihjenis").serializeArray();
  Object.keys(selectedVal).forEach(function(key) {
   currentSelectedKriminal[key] = selectedVal[key]['value'];
  });
  $("#btnSidebarCollapse").on("click", function() {
    $("#sidebar").toggleClass("active");
  });
  $("#carikasus").on('submit', function(e) {
   e.preventDefault();
   $("#btn-cari").attr('disabled', 'disabled');
   $("#btn-cari").html("<span class='fa fa-spinner fa-spin' style='margin:-3px'></span>");
   $.ajax({
    url: 'ajax_carikasus.php',
    method: 'GET',
    data: $("#carikasus").serialize(),
    success: function(res){
     console.log(res);
     var response = parseResult(res);
       if(response === ""){
        $("#hasil_cari").html("<li class='list-group-item'>Tidak ada hasil</li>");
       } else {
        $("#hasil_cari").html(response);
       }
     $("#btn-cari").attr('disabled', null);
     $("#btn-cari").html("<span class='fa fa-search' style='margin:-3px'></span>");
    },
  });
 });
 
  $("#layerjumlah").on('click', function() {
   $("#alattahun").toggleClass('hidden');
   $("#legenda").toggleClass('hidden');
   if(currentViewState == 0){
    currentViewState = 1;
    if(currentSelectedYear != null){
     solok.setStyle(style_cluster);
    }
   } else {
    currentViewState = 0;
    solok.setStyle(style_kelurahan);
   }
  });
  $("#tahunlayer").on('change', function() {
   currentSelectedYear = $(this).val();
   solok.setStyle(style_cluster);
  });
  $("#pilihjenis").on('change', function() {
   currentSelectedKriminal = [];
   selectedVal = $(this).serializeArray();
   Object.keys(selectedVal).forEach(function(key) {
    currentSelectedKriminal[key] = selectedVal[key]['value'];
   });
   syncKriminalIcon();
  });
});
</script>
<?php
$vws->set_inline(ob_get_clean());
include('front_footer.php');
