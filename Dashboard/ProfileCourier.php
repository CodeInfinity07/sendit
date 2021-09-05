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
    <title>Parcel</title>
    <meta name="description" content="SendIt">
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


};
}
 var iw= '<?php echo $_GET["id"] ?>';

 var id='id='+iw;


 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {

 
    if (this.readyState==4 && this.status==200) {
         // alert(this.responseText); 
          
         var arr = JSON.parse(this.responseText);
      
         var i;
             if(arr.length!=0){
          
                               for( i=0;i<arr.length;i++){
                             document.getElementById("name").value=arr[i].Name;
                            document.getElementById("order").value=arr[i].OTP;
                             document.getElementById("paddress").value=arr[i].PickUp;
                                    document.getElementById("daddress").value=arr[i].DropOff;
                            document.getElementById("type").value=arr[i].Type;
                                     document.getElementById("Weight").value=arr[i].Weight;
                          document.getElementById("cmessage").value=arr[i].Comment;
                              document.getElementById("status").value= arr[i].Status;
    document.getElementById("mmessage").value= arr[i].Message;
                          document.getElementById("Price").value= arr[i].Price;
                                     document.getElementById("pdate").value= arr[i].Date;
                            }
             }
  }
}
 xmlhttp.open("POST","getcourier.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);

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
                            <li><a href="#">Order</a></li>
                            <li class="active">Add Manual Order</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>



                <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
          
                                                  

                       <div class="col-lg-8" >
                                                 <div class="card">

                                                    <div class="card-header">
                                <strong class="card-title"><?php echo $_GET['id'];?></strong>
                            </div>
                                                 
                                                    <div class="card-body card-block">
                                                          <form action="addItemToParcel.php" method="post" enctype="multipart/form-data" target="_self"  class="form-horizontal">
                                                     <div class="card-body card-block">

                                                                   <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Order ID</label></div>
                                                                    <div class="col-12 col-md-9">
                                      <input id="order" name="order"  class="form-control" >
                                              </div>
                                               </div>

                                 <div class="row form-group">
                                 <div class="col col-md-3"><label for="select" class=" form-control-label"> Customer Name</label></div>
                                 <div class="col-12 col-md-9">
                                 <input id="name" name="name"  class="form-control" disabled>
                                                                    </div>
                                                                </div>


                                                                      <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Pickup date</label></div>
                                                                    <div class="col-12 col-md-9">
                                             <input id="pdate" name="pdate"  class="form-control"  disabled>
                                              </div>
                                               </div>


                                            <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Pickup address</label></div>
                                                                    <div class="col-12 col-md-9">
                                             <input id="paddress" name="paddress"  class="form-control" disabled >
                                              </div>
                                               </div>

                                              <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Delivery address</label></div>
                                                                    <div class="col-12 col-md-9">
                                             <input id="daddress" name="daddress"  class="form-control" disabled>
                                              </div>
                                               </div> 

                                    <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Type </label></div>
                                                                    <div class="col col-md-3">
                                    <input id="type" name="type"  class="form-control" disabled >
                                              </div>
                                     <div class="col col-md-3"><label for="select" class=" form-control-label">Weight </label></div>
                                                                    <div class="col col-md-3">
                                    <input id="Weight" name="Weight"  class="form-control"  disabled>
                                              </div>
                                               </div> 



                                                  

                                                     <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Status</label></div>
                                                                    <div class="col-12 col-md-9">
                                           <select id="status" name="status" class="form-control" >
                                              <option value="0">--Pending--</option>
                                                     <option value="1">--Accept--</option>
                                                                <option value="2">--On the way--</option>
                                                                   <option value="3">--Delivered--</option>
                                                                           <option value="4">--Reject--</option>
                                           </select>
                                              </div>
                                               </div>    

                                                               
                                      <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Message to customer </label></div>
                                                                    <div class="col-12 col-md-9">
                                             <input id="mmessage" name="mmessage"  class="form-control" >
                                              </div>
                                               </div>                
                  
                              <div class="row form-group">
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Price</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Price" name="Price"  class="input-sm form-control-sm form-control"  required></div></div>      


                        


                               
                           </div>
                                                     

                                               
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-dot-circle-o"></i>Submit
                                                        </button>
                                                        <button type="reset" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-ban"></i> Reset
                                                        </button>
                                                  
                                                          </form>
                                                            </div>
                                                </div>
                                             </div>
                                                            <div class="col-lg-4" >
                        <div class="card">
                    <div class="card-header">
                                <strong class="card-title">Customer Message</strong>
                            </div>
                                 <div class="row form-group">
                               
                             <div class="col-12 col-md-12" style="margin: 10;"><textarea  class="form-control" id="cmessage" name="cmessage"></textarea> </div></div>    
                                               
                      

</div>
</div>

                                           </div>
                           
                                      
                                    </div><!-- .content -->
                                </div><!-- /#right-panel -->
                 



  </div><!-- /#right-panel -->
                               </div>

          
                   <script>
function handleClick() {
     var id = '<?php echo $_GET["id"] ?>';

  window.location.replace("http://139.59.38.160/sendit/Dashboard/storeOrder.php?id="+id);
 
}
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
      // alert(this.responseText);  
         var i;
             if(arr.length!=0){
               var dynamicSelect = document.getElementById("foods");
               for( i=0;i<arr.length;i++){
                var newOption = document.createElement("option");
                newOption.text = arr[i].Name;
                newOption.value = arr[i].ID;//item.whateverProperty
                dynamicSelect.add(newOption);

                                
                               }
             }
  }
}
 xmlhttp.open("POST","getFoods.php",true);
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
          
                               for( i=0;i<arr.length;i++){
                             document.getElementById("Price").value=arr[i].JalpanPrice;
                            document.getElementById("Discount").value=arr[i].Discount;
                             document.getElementById("Finalprice").value=arr[i].JalpanPrice-arr[i].Discount;
                                
                               }
             }
  }
}
 xmlhttp.open("POST","getcourier.php",true);
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
