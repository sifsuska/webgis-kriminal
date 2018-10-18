<?php
require("vendor/autoload.php");

$image = new Bulletproof\Image($_FILES);
$image->setSize(100,5000000)->setLocation(dirname(__FILE__)."/assets/images/artikel");
      
if($image["images"]){
  $upload = $image->upload(); 
  if($upload){
    $folder = new DirectoryIterator(dirname(__FILE__)."/assets/images/artikel");
     foreach($folder as $img) {
      if(!$img->isDot()){
     ?>
      <li><img class="img img-responsive galeri-item" src="assets/images/artikel/<?= $img->getFilename(); ?>"/></li>
     <?php } 
    } 
  } else {
    print_r($image->getError()); 
  }
}