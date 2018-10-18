<?php
include_once('config/koneksi.php');
$config['judul_sub_halaman'] = "Tambah Konten Profil";
$config['hal_aktif'] = "profil";
hak_akses([1],TRUE);
if(isset($_GET['edit'])){
 $config['judul_sub_halaman'] = "Ubah Konten Profil";
 $query = mysqli_query($kon, "select * from konten where id_konten='".$_GET['edit']."'");
 $row = mysqli_fetch_assoc($query);
} else if (isset($_POST['id_konten'])){
 if($_POST['id_konten'] === ''){
  $query = mysqli_query($kon, "insert into konten values('','".$_POST['judul_konten']."','".date('Y-m-d H:i:s')."','".htmlentities($_POST['isi_konten'],ENT_QUOTES)."')");
  if($query){
   echo "<script>alert('Konten Profil berhasil ditambahkan!');\n document.location = 'lihat_profil.php'</script>";
  } else {
   echo "<script>alert('Terdapat Kesalahan Penambahan. );\n document.location = 'lihat_profil.php'</script>";
  }
 } else {
  $query = mysqli_query($kon,"update konten set judul_konten='".$_POST['judul_konten']."', tgl_terbit_konten='".date('Y-m-d H:i:s')."', isi_konten='".htmlentities($_POST['isi_konten'],ENT_QUOTES)."' where id_konten='".$_POST['id_konten']."'");
  if($query){
   echo "<script>alert('Konten Profil berhasil diperbarui');\n document.location = 'lihat_profil.php'</script>";
  } else {
   echo mysqli_error($kon);
   //echo "<script>alert('Terdapat Kesalahan dalam pembaruan data. ');\n document.location = 'lihat_profil.php'</script>";
  }
 }
}
include('header.php');
?>
<style>
#image-list {display:block;width:100%;max-height:340px;overflow:scroll;
    border:10px solid #adadad;margin-top:20px;}
   #image-list > li {list-style:none;margin:2px 5px;}
   #image-list > li > img {max-height:150px; float:left; }
   #image-list > li > img:hover { border:2px solid #269abc; padding:5px;}
</style>
<form method="POST" action="form_profil.php" name="konten" class="form-horizontal">
 <input type="hidden" name="id_konten" value="<?= isset($row['id_konten'])?$row['id_konten']:'' ?>" />
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="judul_konten">Judul Profil</label>
   </div>
   <div class="col-sm-8">
    <input type="text" name="judul_konten" id="judul_konten" class="form-control" value="<?= isset($row['judul_konten'])?$row['judul_konten']:'' ?>" placeholder="Judul" maxlength="35" required />
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-4">
    <label class="control-label" for="isi_konten">Isi Profil</label>
   </div>
   <div class="col-sm-8">
    <textarea name="isi_konten" id="isi_konten" class='form-control tinymce'>
    <?= isset($row['isi_konten'])?html_entity_decode($row['isi_konten']):"" ?>
    </textarea>
    <br>
    <button type="button" name="openImageSelector" class="btn btn-login" data-toggle='modal' data-target='#galeri-modal'><i class="fa fa-image"></i> Tambah Gambar</button>
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-12">
    <button type="submit" class="form-control btn btn-login" name="simpan">Simpan</button>
   </div>
  </div>
</form>
<div id="galeri-modal" class="modal fade" role="dialog">
 <div class="modal-dialog" style="z-index:9999">
  <div class="modal-content">
   <div class="modal-header">
    <h4 class="modal-title">Galeri Gambar</h4>
   </div>
   <div class="modal-body">
   <form name="upload" method="POST" enctype="multipart/form-data" action="aksi_upload.php">
     <input type="hidden" name="MAX_FILE_SIZE" value="5000000"/>
     <input type="file" name="images" id="images" style="visibility:hidden" />
     <button type="button" id="uploadclick" class="btn btn-login"><span class="fa fa-plus"></span> Unggah Gambar</button>
    </form>
    <ul id="image-list">
     <?php 
     $folder = new DirectoryIterator(dirname(__FILE__)."/assets/images/artikel");
     foreach($folder as $img) {
      if(!$img->isDot()){
     ?>
      <li><img class="img img-responsive galeri-item" src="assets/images/artikel/<?= $img->getFilename(); ?>"/></li>
      <?php } } ?>
    </ul>
   </div>
   <div class="modal-footer">
    <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="fa fa-close"></span> Tutup</button>
   </div>
  </div>
 </div>
</div>
<?php ob_start(); ?>
<script type="text/javascript" src="assets/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : 'assets/tiny_mce/tiny_mce.js',

			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,fullscreen,noneditable,visualchars,nonbreaking",

			// Theme options
			theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
		});
	});
</script>
<script>
  $(document).ready(function() {
   var input = document.getElementById("images"),formdata=false, img, reader, gambar;
    if(window.FormData){
     $("#btn").css('display','none');
    }
   
   function showUploadedItem(source){
    var list = $('#image-list');
    list.append("<li><img class='img img-responsive galeri-item' src='"+source+"'/></li>");
   }
   
   $("#uploadclick").click(function() {
    $("#images").click();
    return false;
   });
   
   $("#image-list").on('click','li>img.galeri-item', function() {
    $this = $(this);
    tinymce.activeEditor.execCommand('mceInsertContent', false, '<img src="'+$this.prop('src')+'" class="img img-responsive"/>');
    $("#galeri-modal > div.modal-dialog > div > div.modal-footer > ul > button").click();
   });
   
    $("#images").change(function(evt) {
     formdata = new FormData();
     $this = $(this)[0];
     var i = 0, len = $this.files.length;
     $("#response").html("Uploading...");
     for(;i < len; i++){
      gambar = $this.files[i];
      if(gambar.type.match(/image.*/)){
      //  if(window.FileReader){
      //  reader = new FileReader();
      //  reader.onloadend = function (e) { 
      //   showUploadedItem(e.target.result);
      //  };
      //  reader.readAsDataURL(gambar);
      // } 
       if (formdata) {
        formdata.append("images", gambar);
       }
      }
     }
     $.ajax({
       url: "aksi_upload.php",
       method: "POST",
       data: formdata,
       processData: false,
       contentType: false,
       success: function (res) {
        $("ul#image-list").html(res);
       }
      });
    });
  });
  
    
  </script>
<?php
$vws->set_inline(ob_get_clean());
include('footer.php');