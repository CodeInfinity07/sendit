<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>sendit Dashboard</title>
    <meta name="description" content="sendit">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">
 <link rel="stylesheet" href="vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css">
   <link rel="stylesheet" href="vendors/chosen/chosen.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    <style type="text/css">
        #graph {
  width: 100%;
  height: 128px;
}
    </style>
 <script type="text/javascript">
function myFunction() {
  var myVarFromPhp = '<?php session_start();echo $_SESSION["email"] ?>';
   var admin = '<?php session_start();echo $_SESSION["admin"] ?>';
      var error = '<?php session_start();echo $_SESSION["error"] ?>';
  if(admin!=1){
  	window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }
  if(myVarFromPhp==''){
window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }else{
 
      if(error==1){
alert("Successfully stored information.");
  }else{
    if(error==2){
alert("Error in Storing information");
  }
  }
  }
    //alert("this.responseText");  
       myFunc();

};
</script>
  <script type="text/javascript">
function myFunc() {


 // alert("this.responseText");  

 var i;
    var data =[];
    var labels =[];
  var data1 =[];
  var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {

 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
        //alert(this.responseText);  
         var i;
             if(arr.length!=0){
                     data1.push('');
                                 data.push('');
                                    labels.push("");
                               for( i=0;i<arr.length;i++){

                                          data.push(arr[i].Count);

                                          labels.push(arr[i].symDate);
                            
                                 data1.push(arr[i].Total);
                      
                    
                               }

                               var ctx = document.getElementById( "mem-cha" );
    ctx.height = 100;
    var myChart = new Chart( ctx, {
        type: 'bar',
        data: {
        labels: labels,
            datasets: [
                {
                    label: "total Orders",
                    data: data1,
                    borderColor: "rgba(0, 123, 255, 0.9)",
                    borderWidth: "0",
                    backgroundColor: "rgba(31, 252, 0, 0.5)"
                            },
                            {
                    label: "Delivered",
                    data: data,
                    borderColor: "rgba(0, 123, 255, 0.9)",
                    borderWidth: "0",
                    backgroundColor: "rgba(255, 0, 0, 0.5)"
                            }
                     
                        ]

        },
       
    } );

  }else{
      document.getElementById( "graphs" ).style.display="none";     
  }
}
}
 xmlhttp.open("POST","getHealth.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send("");
 
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

                     <h3 class="menu-title">BULK UPLOAD</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Upload</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddbulkUpload_1.php">File and Images</a></li>
                        
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
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"onclick="location.href = 'http://139.59.38.160/sendit/Dashboard/getComments.php';">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger"><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
           $date=date("Y-m-d");
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
           $sql =$conn->query("SELECT COUNT(ID) FROM comments WHERE  `Date`='$date'");
        foreach($sql as $row) {
echo $row['COUNT(ID)'] ;
         }
     }
        ?></span>
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
     
        </div>

    <div class="content mt-3" >

         
              <div class="col-sm-12 ">
                <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Orders</strong>
                                </div>
                                <div class="card-body">
                                
        <div class="card-group">   

          <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
            $server_ip="139.59.38.160";
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
           $sql =$conn->query("SELECT s.ID,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered<5  GROUP BY d.ID");
        foreach($sql as $row) {

          ?>     
                       
          <div class="col-md-3">
                        <aside class="profile-nav alt">
                            <section class="card">
                        
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Customer Name<span class="badge  pull-right"><?php echo $row["UserID"];?></span></a>
                                    </li>

                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Mobile No<span class="badge badge-success pull-right"><?php echo $row["Mobile"];?></span></a>
                                    </li>
                                 
                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Order ID<span class="badge badge-success pull-right"><?php echo $row["OrderID"];?></span></a>
                                    </li>
                                  
                                     <li class="list-group-item">
                                        <a href="#"> <i ></i>Date<span class="badge badge-danger pull-right"><?php echo $row["Date"];?></span></a>
                                    </li>
                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Status<span class="badge badge-danger pull-right"><?php if($row["Delivered"]==0){
                                          echo "Pending";
                                          }elseif($row["Delivered"]==1){
                                           echo "Accepted";
                                           }elseif($row["Delivered"]==2){
                                                echo "Accepted";
                                          } elseif($row["Delivered"]==3){
                                                echo "Driver Assigned";
                                          }elseif($row["Delivered"]==4){
                                                echo "On the way";
                                          }elseif($row["Delivered"]==5){
                                                echo "Delivered";
                                          }elseif($row["Delivered"]==6){
                                                echo "Cancelled";
                                          }    
                                      ;?></span></a>
                                    </li>
                                          
                                   <li class="list-group-item">
                                        <a href="Profile.php?id=<?php echo $row["OrderID"];?>" style="color: blue;">Details</a>
                                    </li> 
                                  
                                </ul>

                            </section>
                        </aside>
                    </div>  <?php
         }
     }
        ?>
    
</div>
    </div>
  </div>
    </div>      </div>
          


    <div class="content mt-3" >

         
              <div class="col-sm-12 ">
                <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Customer send Image of order</strong>
                                </div>
                                <div class="card-body">
                                
        <div class="card-group">   

          <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
            $server_ip="139.59.38.160";
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
           $sql =$conn->query("SELECT `ID`, `OTP`,(SELECT Name FROM user_details WHERE ID=o.IDUser) AS IDUser,(SELECT Phone_No FROM user_details WHERE ID=o.IDUser) AS Phone_No, `Message`, `Image1`, `From_address`, `From_latitude`, `From_longitude`, `isDelivered`, `Date`, `Time` FROM `orderimages` o WHERE `isDelivered`=0 OR isDelivered=0");
        foreach($sql as $row) {

          ?>     
                       
          <div class="col-md-3">
                        <aside class="profile-nav alt">
                            <section class="card">
                        
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Customer Name<span class="badge  pull-right"><?php echo $row["IDUser"];?></span></a>
                                    </li>

                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Mobile No<span class="badge badge-success pull-right"><?php echo $row["Phone_No"];?></span></a>
                                    </li>

                                 
                                 
                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Order ID<span class="badge badge-success pull-right"><?php echo $row["OTP"];?></span></a>
                                    </li>
                                  
                                     <li class="list-group-item">
                                        <a href="#"> <i ></i>Date<span class="badge badge-danger pull-right"><?php echo $row["Date"];?></span></a>
                                    </li>
                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Status<span class="badge badge-danger pull-right"><?php if($row["Delivered"]==0){
                                          echo "Pending";
                                          }elseif($row["Delivered"]==1){
                                           echo "Accepted";
                                           }elseif($row["Delivered"]==2){
                                                echo "Accepted";
                                          } elseif($row["Delivered"]==3){
                                                echo "Driver Assigned";
                                          }elseif($row["Delivered"]==4){
                                                echo "On the way";
                                          }elseif($row["Delivered"]==5){
                                                echo "Delivered";
                                          }elseif($row["Delivered"]==6){
                                                echo "Cancelled";
                                          }    
                                      ;?></span></a>
                                    </li>
                                          
                                   <li class="list-group-item">
                                        <a href="ProfileImage.php?id=<?php echo $row["OTP"];?>" style="color: blue;">Generate Order</a>
                                    </li> 
                                  
                                </ul>

                            </section>
                        </aside>
                    </div>  <?php
         }
     }
        ?>
    
</div>
    </div>
  </div>
    </div>      </div>
   <!-- .content -->

       <div class="content mt-3" >

         
              <div class="col-sm-12 ">
                <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Parcel request</strong>
                                </div>
                                <div class="card-body">
                                
        <div class="card-group">   

          <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
            $server_ip="139.59.38.160";
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
           $sql =$conn->query("SELECT `ID`,`PickDate`, `OTP`,(SELECT Name FROM user_details WHERE ID=c.UserID) AS  `UserID`,(SELECT Phone_No FROM user_details WHERE ID=c.UserID) AS  `Phone_No`, `DriverID`, `PickUp`, `DropOff`, `Comment`, `pLat`, `pLong`, `dLat`, `dLong`, `Type`, `Weight`, `Status`, `Price`, `Date`, `Time` FROM `courier` c WHERE status=0");
        foreach($sql as $row) {

          ?>     
                       
          <div class="col-md-3">
                        <aside class="profile-nav alt">
                            <section class="card" style="background-color: red;">
                        
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Customer Name<span class="badge  pull-right"><?php echo $row["UserID"];?></span></a>
                                    </li>

                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Mobile No<span class="badge badge-success pull-right"><?php echo $row["Phone_No"];?></span></a>
                                    </li>

                                    <li class="list-group-item">
                                        <a href="#"> <i ></i>Order ID<span class="badge badge-success pull-right"><?php echo $row["OTP"];?></span></a>
                                    </li>
                                  
                                     <li class="list-group-item">
                                        <a href="#"> <i ></i>Pickup Date<span class="badge badge-danger pull-right"><?php echo $row["PickDate"];?></span></a>
                                    </li>

                                      <li class="list-group-item">
                                        <a href="#"> <i ></i>Status<span class="badge badge-danger pull-right"><?php if($row["Status"]==0){
                                          echo "Pending";
                                          }elseif($row["Status"]==1){
                                           echo "Accepted";
                                           }elseif($row["Status"]==2){
                                                echo "Accepted";
                                          } elseif($row["Status"]==3){
                                                echo "Driver Assigned";
                                          }
                                      ;?></span></a>
                                    </li>
                                          
                                   <li class="list-group-item">
                                        <a href="ProfileCourier.php?id=<?php echo $row["OTP"];?>" style="color: blue;">Details</a>
                                    </li> 
                                  
                                </ul>

                            </section>
                        </aside>
                    </div>  <?php
         }
     }
        ?>
    
</div>
    </div>
  </div>
    </div>      </div>


<div class="content mt-3" id="graphs" >
            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Order request</strong>
                                </div>
                                <div class="card-body" >
                                
  
                               
                                <canvas id="mem-cha"></canvas>
                 
                        </div>
                    </div><!-- /# column -->

               
                 
                </div>

                 <div class="content mt-3">

         
              <div class="col-sm-12 mb-4">
        <div class="card-group">
                      <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-briefcase"></i>
                    </div>
                    <div class="h4 mb-0">
                        <span class="count" ><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
          $sql =$conn->query("SELECT COUNT(ID) FROM delievered   ");
        foreach($sql as $row) {
echo $row['COUNT(ID)'] ;
         }
     }
        ?></span>
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">Total Order</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
                <div class="card-body" >
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-stack-exchange "></i>
                    </div>

                    <div class="h4 mb-0">
                        <span class="count" ><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
          $sql =$conn->query("SELECT COUNT(ID) FROM delievered WHERE Delivered=5  ");
        foreach($sql as $row) {
echo $row['COUNT(ID)'] ;
         }
     }
        ?></span>
                    </div>

                    <small class="text-muted text-uppercase font-weight-bold">Total Delivered</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                </div>
            </div>

            <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-clock-o "></i>
                    </div>
                    <div class="h4 mb-0">
                     <span class="count" ><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
          $sql =$conn->query("SELECT COUNT(ID) FROM delievered WHERE Delivered!=5 && Delivered!=6 ");
        foreach($sql as $row) {
echo $row['COUNT(ID)'] ;
         }
     }
        ?></span>
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">Pending Delivery</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
                   <div class="card col-md-6 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="h4 mb-0" ><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
           $sql =$conn->query("SELECT SUM(Cost) AS Cost FROM book_ride WHERE Is_Paid=1");
        foreach($sql as $row) {
echo "R".$row['Cost'] ;
         }
     }
        ?></div>
                  <small class="text-muted text-uppercase font-weight-bold">Total Earning</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
            <div class="card col-md-6 no-padding ">
              <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-sticky-note-o "></i>
                    </div>
                    <div class="h4 mb-0">
                        <span class="count" ><?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
          $sql =$conn->query("SELECT COUNT(ID) FROM foods WHERE Unit<10 ");
        foreach($sql as $row) {
echo $row['COUNT(ID)'] ;
         }
     }
        ?></span>
                    </div>
                    <small class="text-muted text-uppercase font-weight-bold">No of items in Critical Stock</small>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                </div>
            </div>
     
          
        </div>
    </div>
        </div> 
   

     <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.morphbutton.js"></script>

    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
      <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
    <script src="assets/js/init-scripts/data-table/datatables-init.js"></script>
    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
     <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
   
</body>

</html>
