<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Products</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
  
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
    <style>
      #locationField, #controls {
        position: relative;
        width: 200px;
      }
      #autocomplete {
        position: absolute;
        top: 0px;
        left: 0px;
        width: 99%;
      }
      .label {
        text-align: right;
        font-weight: bold;
        width: 100px;
        color: #303030;
        font-family: "Roboto";
      }
      #address {
        border: 1px solid #000090;
        background-color: #f0f9ff;
        width: 480px;
        padding-right: 2px;
      }
      #address td {
        font-size: 10pt;
      }
      .field {
        width: 99%;
      }
      .slimField {
        width: 80px;
      }
      .wideField {
        width: 200px;
      }
      #locationField {
        height: 20px;
        margin-bottom: 2px;
      }
    </style>

<script type="text/javascript">
function myFunction() {
  var myVarFromPhp = '<?php session_start();echo $_SESSION["email"] ?>';
    var error = '<?php session_start();echo $_SESSION["error"] ?>';
    var id = '<?php echo $_GET["id"] ?>';
    document.getElementById('id').value = id;
  if(myVarFromPhp==''){
window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }else{
      if(myVarFromPhp==''){
        window.location.replace("http://139.59.38.160/sendit/Dashboard/sellers.php");
      }
     if(error!=''){
      if(error==1){
alert("Successfully stored information.");
  }else{
    if(error==2){
alert("Error in Storing information! Duplicate item exists.");
  }else{
    alert("Please check the information");
  }
  }
}
  }
};
</script>
</head>

<body onload="myFunction()">
<?php session_start();
       $_SESSION["error"]='';?>

  <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo.png" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="admin.php"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>


                      <h3 class="menu-title">Vendors</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Edit Vendors</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddVendorsCategory.php">Vendor Category</a></li>    
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddStockies.php">Add Vendor</a></li>     
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="VerifyVendors.php">Status Vendors</a></li>     
                        </ul>
                    </li>

                 <h3 class="menu-title">Drivers</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Edit drivers</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddDrivers.php">Add drivers</a></li>    
                          <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="EditDriver.php">Edit drivers</a></li>    
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="TrackDriver.php">Track Driver</a></li>    
                        </ul>
                    </li>
                    <h3 class="menu-title">Seetings</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Settings</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="DefaultSettings.php"> APP Settings</a></li>    
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddImages.php"> APP Top Images</a></li>    
                        </ul>
                    </li>

  <h3 class="menu-title">PushNotification</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Notify</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="PushNotification.php">Send PushNotification</a></li>    
                                 </ul>
                    </li>

                       <h3 class="menu-title">Orders</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Orders</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="CurrentOrders.php">Current Orders</a></li>
                             <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="History.php">Order History</a></li>
                      
                        </ul>
                    </li>

                    


                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list"></i>Products</a>
                        <ul class="sub-menu children dropdown-menu">
                              <li><i class="menu-icon fa fa-th"></i><a href="AllProducts.php">Products</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="AddPrimaryService.php">Primary Category</a></li>
                            <li style="display: none;"><i class="menu-icon fa fa-th"></i><a href="AddNewSecondaryService.php">Secondary Category</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="sellers.php">Add Products</a></li>
            
                        </ul>
                    </li>
  <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                    <li class="menu ">
                        <a href="page-login.php" ><i class="menu-icon fa fa-sign-out"></i> LOGOUT</a>
                       
                    </li>      
                </ul>
            </div>
        </nav>
    </aside>


    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                       
   <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                            
                            </button>
                           
                        </div>

                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="message"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="ti-email"></i>
                            
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have no Mails</p>
                               
                           
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                           <a href="page-login.php" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php  session_start(); echo $_SESSION["email"]."|".$_SESSION["name"];?></a>
                        </a>
                    </div>
                </div>
          </div>

        </header>




        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>                       <?php  
                        
                                 require_once 'DB_Connect.php';
                            
                                 $ID= $_GET["id"];
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 

         }else {  
          $sql =$conn->query("SELECT  `Name` FROM `tez_Canteen` WHERE ID='$ID'");
        foreach($sql as $row) {
    ?>
  
                             <h1><?php echo $row['Name']; ?></h1>
                     
                          <?php
}
}
?></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="index.php">Dashboard</a></li>
                            <li><a href="#">Products</a></li>
                            <li class="active">Add Products</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
          
                                                  

                  
                                              <div class="col-lg-12">
                                                 <div class="card">
                                                    <div class="card-header">
                                                        <strong>Products</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                      
                                                        <form  action="addFinalWorkingSite.php" method="post" enctype="multipart/form-data" target="_self" class="form-horizontal">
                                                            
                                              
                                       

                                                    <div class="card-body card-block">

                                                     <input type="text" id="id" name="id" value="'<?php echo $_GET["id"] ?>'" class="form-control"  style="display: none;">
                                                    
                                                        <div class="row form-group">
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Primary Category</label></div>
                                                                    <div class="col-12 col-md-9">
                                                                        <select id="IDSubsubmenu" name="IDSubsubmenu" class="form-control" onchange="myCategory(this.value)">
                                                                             <option value="">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
             $ID= $_GET["Category"];
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, Name  FROM `menu_type` WHERE Category='$ID'  ");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Name'];?>  
   </option>  
                      <?php
}
}
?>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                              
                                              
                                                                             <div class="row form-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Name</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Name" name="Name" placeholder="Enter the name" class="form-control"  ></div></div>       

                                                               
                  
                            
                             <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Description </label></div>
                             <div class="col-9 col-md-9" style="margin: 10;"><textarea id="Description" name="Description" rows="9" placeholder="Description..." class="form-control"></textarea></div></div>
                            
                             <div class="row form-group">
                              <div class="col col-md-3"><label for="text-input" class=" form-control-label">At price sendit bought</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="MRP" name="MRP" placeholder="Price in R" class="form-control"  ></div></div>     <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">sendit Selling Price to customer</label></div> 
                             <div class="col-9 col-md-9"><input type="number" id="Price" name="Price" placeholder=" Price in R" class="form-control"  ></div></div>     
                             <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Discount on product</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Discount" name="Discount" placeholder="Discount in R" class="form-control"  ></div></div>   
                     
                         
                                                                 <div class="row input-group" style="display: none;">    
                                                       <div class="col col-md-3" ><label for="vehicle1" class=" form-control-label" style="color: green;">Deal of the day</label></div>  
                                                       <div class="col-9 col-md-9" > <input type="checkbox" class="form-control" name="vehicle1" id="vehicle1"value="1">
                                                        </div></div>  
                       
                                          <div class="row form-group">
                                                          <div class="col col-md-3"><label for="text-input" class=" form-control-label" style="color: red;">Browse Image</label></div>
                          
                                                                  <div class="col-9 col-md-9" style="color: red;">   <input name="photo" type="file" id="takePictureField" accept="image/*"  /></div></div>
                      
                                                         <div class="row form-group">
                                                          <div class="col col-md-3"><label for="text-input" class=" form-control-label" style="color: green;">Bulk Upload (Excel file)</label></div>
                          
                                                                  <div class="col-9 col-md-9" style="color: red;">   <input name="bulk" type="file" id="bulk" accept=".csv"  /></div></div>


                                                              <div class="row form-group">
                                                          <div class="col col-md-3"><label for="text-input" class=" form-control-label" style="color: green;">Select files to upload: </label></div>
                          
                                                                  <div class="col-9 col-md-9" style="color: red;">    <input type="file" name="files[]" multiple></div></div>
      
                                                    
                                                     
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-dot-circle-o"></i> Submit
                                                        </button>
                                                        <button type="reset" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-ban"></i> Reset
                                                        </button>
                                                    
                                                          </form>
                                                            </div>

                                                     
                                                </div>
                                             </div>
                                           </div>
                           
                                      
                                    </div><!-- .content -->
                                </div><!-- /#right-panel -->
                                <!-- Right Panel -->

<script type="text/javascript">
  window.uploadPhotos = function(url){
    // Read in file
    var file = event.target.files[0];

    // Ensure it's an image
    if(file.type.match(/image.*/)) {
        console.log('An image has been loaded');

        // Load the image
        var reader = new FileReader();
        reader.onload = function (readerEvent) {
            var image = new Image();
            image.onload = function (imageEvent) {

                // Resize the image
                var canvas = document.createElement('canvas'),
                    max_size = 544,// TODO : pull max size from a site config
                    width = image.width,
                    height = image.height;
                if (width > height) {
                    if (width > max_size) {
                        height *= max_size / width;
                        width = max_size;
                    }
                } else {
                    if (height > max_size) {
                        width *= max_size / height;
                        height = max_size;
                    }
                }
                canvas.width = width;
                canvas.height = height;
                canvas.getContext('2d').drawImage(image, 0, 0, width, height);
                var dataUrl = canvas.toDataURL('image/jpeg');
                var resizedImage = dataURLToBlob(dataUrl);
                $.event.trigger({
                    type: "imageResized",
                    blob: resizedImage,
                    url: dataUrl
                });
            }
            image.src = readerEvent.target.result;
        }
        reader.readAsDataURL(file);
    }
};
</script>
<script type="text/javascript">
  var dataURLToBlob = function(dataURL) {
    var BASE64_MARKER = ';base64,';
    if (dataURL.indexOf(BASE64_MARKER) == -1) {
        var parts = dataURL.split(',');
        var contentType = parts[0].split(':')[1];
        var raw = parts[1];

        return new Blob([raw], {type: contentType});
    }

    var parts = dataURL.split(BASE64_MARKER);
    var contentType = parts[0].split(':')[1];
    var raw = window.atob(parts[1]);
    var rawLength = raw.length;

    var uInt8Array = new Uint8Array(rawLength);

    for (var i = 0; i < rawLength; ++i) {
        uInt8Array[i] = raw.charCodeAt(i);
    }

    return new Blob([uInt8Array], {type: contentType});
}
</script>
<script type="text/javascript">
  $(document).on("imageResized", function (event) {
    var data = new FormData($("form[id*='uploadImageForm']")[0]);
    if (event.blob && event.url) {
    
var vehicle1=0;

   var id = '<?php echo $_GET["id"] ?>';
                    
                                 var IDSubsubmenu=document.getElementById('IDSubsubmenu').value;

                                     var Brand=document.getElementById('Brand').value;
                  
                                 var Name=document.getElementById('Name').value;
                                 
                                 var Weight=document.getElementById('Weight').value;
                                var Unit=document.getElementById('Unit').value;
                               
                               var Description=document.getElementById('Description').value;

                                    var IDsubmenu=document.getElementById('IDsubmenu').value;
                            
                                var MRP= document.getElementById('MRP').value;

                  
                                  var JalpanPrice= document.getElementById('Price').value;
                                  var Discount=  document.getElementById('Discount').value;
                                    if(document.getElementById('vehicle1').checked==true){
                                         vehicle1=1;
                                    }else{
                                      
                                      vehicle1=0;
                                    }

                                         data.append('id', id);

                                           data.append('photo', event.blob, Name+"_p.png");
      data.append('Brand', Brand);
    
                  data.append('IDSubsubmenu', IDSubsubmenu);
                  data.append('Name', Name);
            data.append('Weight', Weight);
                  data.append('Unit', Unit);
                  data.append('Description', Description);
            data.append('IDsubmenu', IDsubmenu);
                  data.append('MRP', MRP);
                      data.append('Price', JalpanPrice);
            data.append('Discount', Discount);
                  data.append('vehicle1', vehicle1);


                              
        $.ajax({
          url: '/sendit/Dashboard/addFinalWorkingSite.php',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function(data){
              location.reload(true); 
              
            },
    error: function (request, status, error) {
     location.reload(true); 

    }
        });
    }
});
</script>


<script type="text/javascript">
function myCategory(id) {

var id='id='+id;


 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
      //  alert(this.responseText);  
         var i;
             if(arr.length!=0){
               var dynamicSelect = document.getElementById("IDsubmenu");
               
         
                               for( i=0;i<arr.length;i++){
                             
                                    var newOption = document.createElement("option");
                newOption.text = arr[i].Name;
                newOption.value = arr[i].ID;//item.whateverProperty
                dynamicSelect.add(newOption);

                                
                               }
             }
  }
}
 xmlhttp.open("POST","getFirst.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);
  }

</script>

<script type="text/javascript">
function myCategory2(id) {

var id='id='+id;


 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
      //  alert(this.responseText);  
         var i;
             if(arr.length!=0){
               var dynamicSelect = document.getElementById("Brand");
               
         
                               for( i=0;i<arr.length;i++){
                             
                                    var newOption = document.createElement("option");
                newOption.text = arr[i].Name;
                newOption.value = arr[i].ID;//item.whateverProperty
                dynamicSelect.add(newOption);

                                
                               }
             }
  }
}
 xmlhttp.open("POST","getthird.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);
  }

</script>
          
          
                            <script src="vendors/jquery/dist/jquery.min.js"></script>
                            <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
                            <script src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
                            <script src="vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>
                            <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
                            <script src="assets/js/main.js"></script>
                            <script src="main.js"></script>
</body>
</html>
