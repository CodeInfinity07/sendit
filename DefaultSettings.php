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
    <title>Add Settings</title>
    <meta name="description" content="sendit">
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
  <link href="css/timepicki.css" rel="stylesheet">
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
  if(myVarFromPhp==''){
window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }else{
     if(error!=''){
      if(error==1){
alert("Successfully stored information.");
  }else{
    if(error==2){
alert("Error in Storing information");
  }else{
    alert("Please check the information");
  }
  }
}

 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
        // alert(this.responseText);  
         var i;
             if(arr.length!=0){
                           
                               for( i=0;i<arr.length;i++){
                                  document.getElementById('discount').value=arr[i].Discounts;
                                 document.getElementById('monimumorders').value=arr[i].MinimumOrderPrice;
                                 document.getElementById('minimumweight').value=arr[i].MinimumOrderWeight;
                                 document.getElementById('minimumdistance').value=arr[i].MinimumDistance;
                                document.getElementById('maximumdistance').value=arr[i].MaximumDistance;
                                 document.getElementById('freedeldistance').value=arr[i].FreeDistance;
                                 document.getElementById('price').value=arr[i].PricePerKM;
                                   document.getElementById('starttime').value=arr[i].StartTime;
                                    document.getElementById('endtime').value=arr[i].EndTime;
                                    document.getElementById('cancellation').value=arr[i].CancellationCharge;
                                       document.getElementById('Facebook').value=arr[i].FacebookPage;
                                   document.getElementById('Instagram').value=arr[i].InstagramPage;
                                    document.getElementById('Youtube').value=arr[i].YoutubePlaylis;
                                    document.getElementById('WhatsApp').value=arr[i].WhatsApp;
                               }
             }
  }
}
 xmlhttp.open("POST","getDefaultSettings.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send("id");
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
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="index.php">Dashboard</a></li>
                            <li><a href="#">Settings</a></li>
                            <li class="active">Default</li>
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
                                                
                                                    <div class="card-body card-block">
                                                        <form action="addSettings.php" method="post" enctype="multipart/form-data" target="_self" class="form-horizontal">
                                                            
                                              
                                       

                                                    <div class="card-body card-block">
                                                    
                                                      
                                                                             <div class="row form-group" style="display: none;">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Discount on all product</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="discount" name="discount" placeholder="Discount on all product in percentage" class="form-control"  ></div></div>       

                                                                             <div class="row form-group" style="display: none;">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Minimum Order in R</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="monimumorders" name="monimumorders" placeholder="Minimum order value in R" class="form-control"  ></div></div>       

                                              
                                                                             <div class="row form-group" style="display: none;">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Minimum order weight in KG</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="minimumweight" name="minimumweight" placeholder="Weight in kg" class="form-control"  ></div></div>       

                             <div class="row form-group" style="display: none;">
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Minimum Distance in KM</label></div>
                             <div class="col-9 col-md-9"><input type="number"  step="0.01" id="minimumdistance" name="minimumdistance" placeholder="Distance in km" class="form-control"  ></div></div>
                         
                            <div class="row form-group" style="display: none;">
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Maximum Distance in KM</label></div>
                             <div class="col-9 col-md-9"><input type="number"  step="0.01" id="maximumdistance" name="maximumdistance" placeholder="Distance in KM" class="form-control"  ></div></div>                                          
                  
                            
                             <div class="row form-group" style="display: none;">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Delivery Free upto distance in KM</label></div>
                             <div class="col-9 col-md-9" style="margin: 10;"><input id="freedeldistance" name="freedeldistance" rows="9" placeholder="Delivery Free upto distance, 0 for free for all" class="form-control"></div></div>
                            
                             <div class="row form-group" style="display: none;">
                              <div class="col col-md-3"><label for="text-input" class=" form-control-label">Delivery charge per KM</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="price" name="price" placeholder="Price in Rs" class="form-control"  ></div></div>   
                                <div class="row form-group" style="display: none;">
                              <div class="col col-md-3"><label for="text-input" class=" form-control-label">Cancellation charge</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="cancellation" name="cancellation" placeholder="Price in R" class="form-control"  ></div></div>    
                             <div class="row form-group" style="display: none;">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">ORDER accept start time</label></div> 
                             <div class="col-9 col-md-9"><input type="time" id="starttime" name="starttime" placeholder="Time" class="form-control"  ></div></div>     <div class="row form-group" style="display: none;">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">ORDER accept End time</label></div>
                             <div class="col-9 col-md-9"><input type="time" id="endtime" name="endtime" placeholder="Time" class="form-control"  ></div></div>    
         <div class="row form-group">
                              <div class="col col-md-3"><label for="text-input" class=" form-control-label">Facebook Page Link</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Facebook" name="Facebook" placeholder="Facebook Page Link" class="form-control"  ></div></div>   
                                <div class="row form-group">
                              <div class="col col-md-3"><label for="text-input" class=" form-control-label">Instagram Page Link</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Instagram" name="Instagram" placeholder="Instagram Page Link" class="form-control"  ></div></div>    
                             <div class="row form-group" style="display: none;">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Youtube Playlist</label></div> 
                             <div class="col-9 col-md-9"><input type="text" id="Youtube" name="Youtube" placeholder="Youtube Playlist" class="form-control"  ></div></div>     <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">WhatsApp no</label></div>
                             <div class="col-9 col-md-9"><input type="number" id="WhatsApp" name="WhatsApp" placeholder="WhatsApp No" class="form-control"  ></div></div> 
                                               
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


          
                            <script src="vendors/jquery/dist/jquery.min.js"></script>
                                <script src="js/timepicki.js"></script>
    <script>
  $('#starttime').timepicki();
    </script>
      <script>
  $('#endtime').timepicki();
    </script>
                            <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
                            <script src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
                            <script src="vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>
                            <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
                            <script src="assets/js/main.js"></script>
                            <script src="main.js"></script>
</body>
</html>
