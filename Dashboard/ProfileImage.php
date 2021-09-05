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
    <title>Order Image</title>
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


  <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        $ID=$_GET["id"];

        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `OTP`,(SELECT Name FROM user_details WHERE ID=o.IDUser) AS IDUser,(SELECT Phone_No FROM user_details WHERE ID=o.IDUser) AS IDUser, `Message`, `Image1`, `From_address`, `From_latitude`, `From_longitude`, `isDelivered`, `Date`, `Time` FROM `orderimages` o WHERE `isDelivered`=0 AND OTP='$ID'");
        foreach($sql as $row) {
    ?>

                <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
          
                                                  

                       <div class="col-lg-6" >
                                                 <div class="card">

                                                    <div class="card-header">
                                <strong class="card-title"><?php echo $row['OTP'];?></strong>
                            </div>
                                                 
                                                    <div class="card-body card-block">
                                                          <form action="addItemToOrder.php" method="post" enctype="multipart/form-data" target="_self"  class="form-horizontal">
                                                     <div class="card-body card-block">

                                                                   <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Order ID</label></div>
                                                                    <div class="col-12 col-md-9">
                                      <input id="order" name="order"  class="form-control" value="<?php echo $row['OTP'];?>">
                                              </div>
                                               </div>

                                 <div class="row form-group">
                                 <div class="col col-md-3"><label for="select" class=" form-control-label"> Vendor Name</label></div>
                                 <div class="col-12 col-md-9">
                                <select id="vname" name="vname" class="form-control" onchange="myCategory(this.value)" >
                                                                             <option value="">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, Name  FROM `tez_Canteen`  ");
        foreach($sql as $row1) {
    ?>

 <option value="<?php echo $row1['ID']; ?>">  
                                         <?php echo $row1['Name'];?>  
   </option>  
                      <?php
}
}
?>
                                                                        </select>
                                                                    </div>
                                                                </div>


                                            <div class="row form-group" >
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Items</label></div>
                                                                    <div class="col-12 col-md-9">
                                           <select id="foods" name="foods" class="form-control" onchange="myCategory2(this.value)">
                                              <option value="">--Select--</option>
                                           </select>
                                              </div>
                                               </div>

                                                                             
                  
                                                          <div class="row form-group">
                             <div class="col col-md-3"><label for="text-input" class=" form-control-label">Price</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Price" name="Price"  class="input-sm form-control-sm form-control"  disabled></div></div>      


                             <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Discount </label></div>
                             <div class="col-9 col-md-9" style="margin: 10;"><input id="Discount" name="Discount"  class="form-control" disabled></div></div>
                             
                             <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Final Price </label></div>
                             <div class="col-9 col-md-9" style="margin: 10;"><input id="Finalprice" name="Finalprice"  class="form-control" disabled></div></div> 


                             <div class="row form-group">
                                <div class="col col-md-3"><label for="text-input" class=" form-control-label">Quantity required </label></div>
                             <div class="col-9 col-md-9" style="margin: 10;"><input type="number" id="quantity" name="quantity"   class="form-control" required></div></div>                  
                           </div>
                                                     

                                               
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-dot-circle-o"></i> Add Item to order
                                                        </button>
                                                        <button type="reset" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-ban"></i> Reset
                                                        </button>
                                                  
                                                          </form>
                                                            </div>
                                                </div>
                                             </div>
                                                            <div class="col-lg-6" >
                        <div class="card">
                    <div class="card-header">
                                <strong class="card-title">Message</strong>
                            </div>
                                 <div class="row form-group">
                               
                             <div class="col-12 col-md-12" style="margin: 10;"><textarea  class="form-control" ><?php echo $row['Message'];?></textarea> </div></div>    
                                               
                            <div class="card-header">
                                <strong class="card-title">Image sent by customer</strong>
                            </div><div class="card-body card-block">
               <img src="<?php echo $row['Image1'];?>" alt="Logo">                                                                           
                                </div>
               

</div>
</div>

                                           </div>
                           
                                      
                                    </div><!-- .content -->
                                </div><!-- /#right-panel -->
                                <!-- Right Panel -->
                      <?php
}
}
?>




                    <div class="col-md-12">
                        <div class="card" >
                         <div class="card-header">
                                <strong class="card-title">Products</strong>
                            </div>
                            <div class="card-body" >
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                           <th>Vendor</th>
                                                          <th>Item Name</th>
                                                        
                                          
                                                 <th style="color: green;">Quantity<br>required</th>
                                           
                                               <th>Discount</th>
                                
                                               <th>Total<br>Price</th>
                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                        $id=$_GET['id'];
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                       $users =$conn->query("SELECT s.ID,f.Name,f.Weight,f.MRP,f.JalpanPrice,s.NoofItems, f.Unit,f.Discount,s.isOntheWay,s.onthewayDate, s.onthewayTime, s.receipt, s.message, s.reachDate, s.reachTime,(SELECT  Name FROM  tez_Canteen WHERE ID=s.CanteenID ) AS Vendor FROM `store_order` s INNER JOIN foods f ON f.ID=s.FoodID   WHERE s.OrderID='$id'");
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                   <td><?php echo $count; ?></td>
                    <td><?php echo $user['Vendor']; ?></td>
                                            <td><?php echo $user['Name']; ?></td>
                       
                      
                              <td><?php echo $user['NoofItems']; ?></td>
        
                                    <td><?php echo ($user['Discount']); ?></td>

                                    <td><?php echo ($user['NoofItems']*$user['JalpanPrice']); ?></td>



                                
                

                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                       
                                                        <button type="submit" class="btn btn-danger btn-sm" onclick="handleClick()">
                                                            Complete the order
                                                        </button>
                                                      
                                                  
                        </div>
                             
                    </div>

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
 xmlhttp.open("POST","getmoreFoodDetails.php",true);
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
