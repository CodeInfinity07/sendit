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
 <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.1/firebase-database.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">
    <link rel="stylesheet" type="text/css" href="css/dncalendar-skin.min.css">
    <link href="jquery.datepicker2.css" rel="stylesheet">
    <link href="css/timepicki.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>






 <script type="text/javascript">
function myFunction() {
     
    document.getElementById('confirm').style.display="none";
      document.getElementById('deliverydetails').style.display="none";
           document.getElementById('update').style.display="none";
 document.getElementById('ontheway').style.display="none";
    var orderid = '<?php echo $_GET["id"] ?>';
  //  alert(orderid);
    document.getElementById("orderid").value=orderid;
  var myVarFromPhp = '<?php session_start();echo $_SESSION["email"] ?>';
    var admin = '<?php echo $_SESSION["admin"] ?>';
  if(admin!=1){
    window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }
  if(myVarFromPhp==''){
window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }else{
    var id='id='+<?php echo $_GET["id"] ?>;
 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
         console.log(this.responseText);  
         var i;
             if(arr.length!=0){
                           
                               for( i=0;i<arr.length;i++){
                               //	alert(arr[i].Driver_ID);
                               	  if(arr[i].Driver_ID!=null){
                               	  	    document.getElementById('Driver').value=arr[i].Driver_ID;
                                  document.getElementById('Vehicle').value=arr[i].Vehicle_ID;
                               	  }
                              
                                    if(arr[i].ETR.length!=0){
                                     var res = arr[i].ETR.split(" ");
                                     if (typeof res[1] !== "undefined") {
 										document.getElementById('date').value=res[0]+res[1];
											}else{
														document.getElementById('date').value=res[0];
											}
                                        
                          
                                    }
                                   if(arr[i].pCost>1){
                document.getElementById('damt').value=arr[i].Cost;
                        document.getElementById('damt').readOnly=true;
                                   }

                                 
                                    if(arr[i].Delivered==2 || arr[i].Delivered==1){
                           document.getElementById('accept').style.display="none";
                                    document.getElementById('confirm').style.display="none";
                                      document.getElementById('deliverydetails').style.display="block";
                                  }
                                if(arr[i].Delivered==3){
                           document.getElementById('accept').style.display="none";
                                  document.getElementById('accepted').style.display="none";
                                    document.getElementById('confirm').style.display="none";
                                      document.getElementById('deliverydetails').style.display="block";
                                           document.getElementById('ontheway').style.display="block";

                                  }

 if(arr[i].Delivered==4){
                           document.getElementById('accept').style.display="none";
                                  document.getElementById('accepted').style.display="none";
                                    document.getElementById('confirm').style.display="none";
                                      document.getElementById('deliverydetails').style.display="block";
                                           document.getElementById('rejectreason').style.display="none";
  document.getElementById('ontheway').style.display="none";
                                  }



                                  
                               }
             }
  }
}
 xmlhttp.open("POST","getOrders.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);
  }
};
</script>





                                                     
<script type="text/javascript">
  function myDelivered(id) {
window.location.replace("http://139.59.38.160/sendit/Dashboard/OrderDelivered.php?id="+id);
  
};
</script>
<script type="text/javascript">
  function myOrderReject(id) {
        var empty=document.getElementById("reason").value;
        if(empty==''){
          alert("Please mention reason for cancel")
        }else{
         window.location.replace("http://139.59.38.160/sendit/Dashboard/OrderReject.php?id="+id+"&reason="+empty); 
        }

  
};
</script>

<script type="text/javascript">
  function senditVerify(id) {
   // alert(unique);
window.location.replace("http://139.59.38.160/sendit/Dashboard/OrderVerify.php?id="+id);
  
};
</script>

</head>

<body onload="myFunction()">

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
                                    <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AddVendorsCategory.php"> Category</a></li>   
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
           $sql =$conn->query("SELECT COUNT(ID) FROM contactus WHERE  `Date`='$date'");
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
                           <a href="page-login.php" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php   echo $_SESSION["email"]."|".$_SESSION["name"];?></a>
                        </a>
                    </div>
                </div>
          </div>

        </header>

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Profile</h1>
                    </div>
                </div>
            </div>
     
        </div>

        <div class="content mt-3">

         
              <div class="col-sm-12 mb-4">
        <div class="card-group">
          <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
           $id=$_GET["id"];
            $server_ip="139.59.38.160";
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  
             $sql =$conn->query("SELECT s.ID,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,(SELECT Logout FROM user_details WHERE ID=s.UserID) AS `Logout`,s.OrderID,s.OrderID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE  s.OrderID='$id' GROUP BY d.ID");
        foreach($sql as $row) {
          ?>                 <div class="col-md-3">
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
                                        <a href="#"> <i ></i>Is Logout APP<span class="badge badge-danger pull-right"><?php if($row["Logout"]==0){
                                          echo "NO";
                                          }elseif($row["Logout"]==1){
                                           echo "YES";
                                           }
                                      ;?></span></a>
                                    </li>
                                </ul>

                            </section>
                        </aside>
                    </div><?php
         }
     }
        ?>

  <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        $id=$_GET["id"];

            $server_ip="139.59.38.160";
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  

           $result =$conn->query("SELECT ID,UserID,OrderID FROM  store_order WHERE OrderID='$id'");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $uID=$row["ID"];
                  $UserID=$row["UserID"];
                       $CanteenID=$row["OrderID"];
        }
         }
          $result =$conn->query("SELECT ID FROM  delievered WHERE OrderID='$id'");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $uID=$row["ID"];
            
        }
         }

           $sql =$conn->query("SELECT `ID`,Unique_Ride_Code, `From_Address`, `From_Latitude`, `From_Longitude`, `Cost`,pCost,Driver_ID,Vehicle_ID, PaymentMode, PaymentVerified FROM `book_ride` b  WHERE IDDelivery ='$uID' AND User_ID='$UserID'");
        foreach($sql as $row) {

          ?>         <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i><strong class="card-title pl-2">Payment Mode</strong>
                         
                            </div>
                            <div class="card-body">
                                  <h2 class="text-sm-center mt-2 mb-1" style="color: red;"><strong class="card-title pl-2">Total:- R </strong><?php echo $row["Cost"];?></h2>

                                     <div class="location text-sm-center" style="color: green;">Old Total <h2><?php if($row["pCost"]==0){
                                           echo "NA";
                                           }else{
                                                echo $row["pCost"];
                                          } 
    ?></h2></div>
                          
   <div class="location text-sm-center">Payment Mode <h2><?php if($row["PaymentMode"]==0){
                                          echo "Not Choosen";
                                          }elseif($row["PaymentMode"]==1){
                                           echo "COD";
                                           }elseif($row["PaymentMode"]==2){
                                                echo "EFT";
                                          } elseif($row["PaymentMode"]==3){
                                                echo "CARD";
                                          } 
    ?><?php if($row["PaymentMode"]==2){ if($row["PaymentVerified"]==0){?>
                                           <a href="#"><br>Status: Payment Pending<br></a>

                                            <button  id="verify" class="btn btn-primary btn-sm" onclick="senditVerify(<?php echo $row['ID'];?>)">
                                                            <i class="fa fa-dot-circle-o"></i> Verify
                                                        </button><?php
                                          }else{?>
                                           <a href="#"><br>Status: Payment Paid</a>

                                           <?php

                                          } 
                                        }

    ?>
    
    </h2>
     </div>
    
                                </div>
                          
                                
                            </div>
                        </div>

                        <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i><strong class="card-title pl-2">Address</strong>
                         
                            </div>
                            <div class="card-body">
                         
                                    <h5 class="text-sm-center mt-2 mb-1"><?php echo $row["From_Address"];?></h5>
                                    <div class="location text-sm-center"><?php echo $row["From_Longitude"];?></div>
                                      <div class="location text-sm-center"> <?php echo $row["From_Latitude"];?></div>
   <div class="location text-sm-center">Delivery agent <h2><?php if($row["Driver_ID"]!=0){
    $dID= $row["Driver_ID"];
     $sql =$conn->query("SELECT Name FROM `user_details` WHERE ID='$dID'");
        foreach($sql as $user) {
          echo $user["Name"];
        }
   }
    ?></h2></div>
      <div class="location text-sm-center">Vehicle No <br><?php if($row["Vehicle_ID"]!=0){
                echo $row["Vehicle_ID"];
      }
        ?></div>
                                </div>
                          
                                
                            </div>
                        </div>
                  <?php
         }
     }
        ?>


<!-- .content -->
              



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
                                    
                                              <th>Accept</th>
                                               <th>Driver<br>Onway</th>
                                                <th>Onway date</th>
                                              
                                                       <th>Receipt</th>
                                                                <th>Message</th>
                                                          <th>Reached <br>Date</th>
                                                 
                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                        $id=$_GET['id'];
                  $server_ip="139.59.38.160";
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

                        
                                   <td> <input type='checkbox' id="out" onclick='handleClick(this,<?php echo $_GET['id']; ?>,<?php echo $user['ID']; ?>);' checked></td>

                                    <td><?php if($user['isOntheWay']==1){
                                      echo "YES";
                                    }else if($user['isOntheWay']==2){
                                      echo "REACHED";
                                    }else{
                                       echo "NO";
                                    } ?></td>

                                         <td><?php if($user['onthewayDate']=='0000-00-00'){
                                      echo "NA";
                                    }else{
                                   echo ($user['onthewayDate']." ".$user['onthewayTime']);
                                    } ?></td>

   

                                        <?php if($user["isOntheWay"]>1){?>
                                             <td>
                                       <a href="<?php echo 'http://' . $server_ip .'/' .'sendit' .'/'.'Dashboard'.'/'.'orders'.'/'.$user["receipt"];?>"  download style="display:block; width: 60px;">Download</a>      </td>
                                          <?php }else{?>
                                        <td>
                                       <a href="#" >NA</a>      </td>
                                          <?php }?>

                                                 <td><?php echo ($user['message']); ?></td>
                              
                                   <td><?php if($user['reachDate']=='0000-00-00'){
                                      echo "NA";
                                    }else{
                                      echo ($user['reachDate']." ".$user['reachTime']);
                                    } ?></td>


                                
                

                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                       
                        </div>
                             
                    </div>

                                        <div class="col-lg-12" id="update" >
                                                 <div class="card" >
                                                    <div class="card-header">
                                                        <strong>Update Order</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                        <form action="UpdateOrder.php" method="post" enctype="multipart/form-data" target="_self" class="form-horizontal">
                                                            <div class="col-lg-12">


                                              
                                       

                                                    <div class="card-body card-block">

                                                              <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Order ID</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="Order" name="Order"  class="input-sm form-control-sm form-control" value="<?php echo $_GET["id"] ?>"></div>
                           
                            
                                                            </div>
                                                    
                                                                    <div class="row form-group">
                                                                    <div class="col col-md-3"><label for="select" class="input-sm form-control-sm form-control-label">Product </label></div>
                                                                    <div class="col-6 col-md-6">
                                                                        <select id="ID" name="ID" class="input-sm form-control-sm form-control" required>
                                                                          <option value="">--Select--</option>

                                                                            <?php
                      require_once 'DB_Connect.php';
                        $id=$_GET['id'];
                 
                      $db = new Db_Connect();
                      $conn = $db->connect();
                    
      
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {                   $users =$conn->query("SELECT s.ID,f.Name,f.Weight,f.MRP,f.JalpanPrice,s.NoofItems, f.Unit,f.Discount FROM `store_order` s INNER JOIN foods f ON f.ID=s.FoodID  WHERE s.OrderID='$id'");
        foreach($users as $row) {
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
                                                            <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">New Quantity</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="CDNo" name="CDNo" placeholder="0 to delete the product" class="input-sm form-control-sm form-control" required></div>
                           
                            
                                                            </div>
                                                     
                                        
                                                      </div>



                                               
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


                    <div class="col-lg-12" id="accept" style="margin-top: 30px;">
                                                 <div class="card" >
                                                    <div class="card-header" style="background-color: green; color: white;">
                                                        <strong>Accept Order</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                             <div class="col-lg-12">


                                             

                                                    <div class="card-body card-block">

                                                              <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Message to customer</label></div>
                             <div class="col-9 col-md-9"><textarea type="text" lines=4 id="acceptmessage" name="acceptmessage"  class="input-sm form-control-sm form-control" ></textarea></div>
                           
                            
                                                            </div>
                                     
                                                      </div>



                                               
                                                        <button type="submit" class="btn btn-primary btn-sm" onclick="AcceptOrder(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-dot-circle-o"></i> Accept
                                                        </button>
                                                      
                                                   
                                                            </div>
                                                </div>
                                              
                                          
                                            </div>
                                        </div>

                                                       <div class="col-lg-12" id="confirm" style="margin-top: 30px;">
                                                 <div class="card" >
                                                    <div class="card-header" style="background-color: green; color: white;">
                                                        <strong>Confirm Order</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                             <div class="col-lg-12">


                                             

                                                    <div class="card-body card-block">

                                                              <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Message to customer</label></div>
                             <div class="col-9 col-md-9"><textarea type="text" lines=4 id="confirmmessage" name="confirmmessage"  class="input-sm form-control-sm form-control" ></textarea></div>
                           
                            
                                                            </div>
                                     
                                                      </div>



                                               
                                                        <button type="submit" class="btn btn-primary btn-sm" onclick="ConfirmOrder(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-dot-circle-o"></i> Accept
                                                        </button>
                                                      
                                                   
                                                            </div>
                                                </div>
                                              
                                          
                                            </div>
                                        </div>

                                
                                   

                                              <div class="col-lg-12" id="deliverydetails" style="margin-top: 30px;">
                                                 <div class="card">
                                               <div class="card-header" style="background-color: brown; color: white;">
                                                        <strong>Delivery Details</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                      

                                                    <div class="card-body card-block" >
                                                    
                                                 <div class="row input-group">

                                                     <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Order ID</label></div>
                             <div class="col-9 col-md-9"><input type="text" id="orderid" name="orderid"  class="input-sm form-control-sm form-control"  ></div>
                                                                    
                                   
                                                                    <div class="col col-md-3" style="display: none;"><label for="select" class=" input-sm form-control-sm form-control-label">Delivery agent</label></div>
                                                                     <div class="col-9 col-md-9" style="display: none;">
                                                                        <select id="Driver" name="Driver" class="input-sm form-control-sm form-control">
                                                                          <option value="14" selected>TEST2</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, Name  FROM `user_details` WHERE role=2");
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
                                                               
                                                             
                              <div class="col col-md-3" style="display: none;"><label for="text-input" class=" input-sm form-control-sm form-control-label">Vehicle No</label></div>
                          
                                         <div class="col-9 col-md-9" style="display: none;">
                                                                        <select id="Vehicle" name="Vehicle"  class="input-sm form-control-sm form-control">
                                                                          <option value="1" selected>AX09BA1234</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT ID,`Vehicle_No` FROM `vehicle_detail`");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['Vehicle_No']; ?>">  
                                         <?php 
                                      
                                         echo $row['Vehicle_No'];?>  
   </option>  
                      <?php
}
}
?>
                                                                        </select>
                                                                    </div>
                            <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Estimated Date</label></div>
                                <div class="col-9 col-md-9">  <input type="text" name="date" id="date" data-select="datepicker" placeholder="Estimated date"> </div>
                             
    <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Estimated Time</label></div>
                                <div class="col-9 col-md-9">  <input type="text" name="time" id="time" placeholder="Estimated time" > </div>

                                       <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Enter the new TOTAL AMOUNT due by the customer</label></div>
                             <div class="col col-md-3"><input type="number" id="damt" name="damt" placeholder="Enter 0 if no discount" class="input-sm form-control-sm form-control"  ></div>
                         </div>

                     
                       </div>
                             


                                                        
                                                     
                                              <button  id="accepted" class="btn btn-primary btn-sm" onclick="senditAccept(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-dot-circle-o"></i> Accept
                                                        </button>
                                                        
                                                        
                                                         <button  id="delivered" class="btn btn-info btn-sm"onclick="myDelivered(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-handshake-o"></i> Delivered
                                                        </button>

                                                 
                                                            </div>
                                                </div>
                                             </div>
         </div>
                                        

              <div class="col-lg-12" id="ontheway" style="margin-top: 30px;">
                                                 <div class="card" >
                                                    <div class="card-header" style="background-color: violet; color: white;">
                                                        <strong>On the way</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                            <div class="col-lg-12">


                                             

                                                    <div class="card-body card-block">

                                                              <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Message to customer</label></div>
                             <div class="col-9 col-md-9"><TEXTAREA type="text" lines=3 id="onreason" name="onreason"  class="input-sm form-control-sm form-control"></TEXTAREA></div>
                           
                            
                                                            </div>
                                     
                                                      </div>



                                               
                                                    <button   class="btn btn-warning btn-sm"onclick="myOntheway(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-handshake-o"></i> On the way
                                                        </button>
                                              
                                                            </div>
                                                </div>
                                              
                                          
                                            </div>
                                           </div>
                                  
                                                    <div class="col-lg-12" id="rejectreason" style="margin-top: 30px;">
                                                 <div class="card" >
                                                    <div class="card-header" style="background-color: red; color: white;">
                                                        <strong>Reject Order</strong>
                                                    </div>
                                                    <div class="card-body card-block">
                                                            <div class="col-lg-12">


                                             

                                                    <div class="card-body card-block">

                                                              <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Message to customer</label></div>
                             <div class="col-9 col-md-9"><TEXTAREA type="text" lines=3 id="reason" name="reason"  class="input-sm form-control-sm form-control"></TEXTAREA></div>
                           
                            
                                                            </div>
                                     
                                                      </div>



                                               
                                                       <button  id="reject" class="btn btn-danger btn-sm"onclick="myOrderReject(<?php echo $_GET['id']?>)">
                                                            <i class="fa fa-ban"></i> Reject
                                                        </button>
                                                      
                                                            </div>
                                                </div>
                                              
                                          
                                            </div>
       
  
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/init-scripts/chart-js/chartjs-init.js"></script>
  <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="jquery.datepicker2.js"></script>
    <script src="js/timepicki.js"></script>
 
    <script>
  $('#time').timepicki();
    </script>


<script type="text/javascript">
  function senditAccept(id) {

    var name=document.getElementById("Driver").value;

            var vehicle=document.getElementById("Vehicle").value;
               var date=document.getElementById("date").value;
                 var time=document.getElementById("time").value;
        var damt=parseFloat(document.getElementById("damt").value).toFixed(2);

       //   alert(damt);
            if(name.length!=0 && vehicle.length!=0 ){
                if(!isNaN(damt)){
              window.location.replace("http://139.59.38.160/sendit/Dashboard/OrderAccpet.php?id="+id+"&name="+name+"&vehicle="+vehicle
                +"&date="+date+"&time="+time+"&damt="+damt);
            }else{
   window.location.replace("http://139.59.38.160/sendit/Dashboard/OrderAccpet.php?id="+id+"&name="+name+"&vehicle="+vehicle
                +"&date="+date+"&time="+time);
            }
            }else{
              alert("Please fill the from");
            }

  
};
</script>

<script type="text/javascript">
  function AcceptOrder(id) {
        var message=document.getElementById("acceptmessage").value;
        if(message==''){
         if (confirm("Empty message! Default message will show to customer")) {
         	 window.location.replace("http://139.59.38.160/sendit/Dashboard/AcceptOrder.php?id="+id+"&message="+message+"&role="+1); 
         }
        }else{
         window.location.replace("http://139.59.38.160/sendit/Dashboard/AcceptOrder.php?id="+id+"&message="+message+"&role="+1); 
        }

  
};
</script>

<script type="text/javascript">
  function ConfirmOrder(id) {
        var message=document.getElementById("confirmmessage").value;
        if(message==''){
         if (confirm("Empty message! Default message will show to customer")) {
         	 window.location.replace("http://139.59.38.160/sendit/Dashboard/AcceptOrder.php?id="+id+"&message="+message+"&role="+2); 
         }
        }else{
         window.location.replace("http://139.59.38.160/sendit/Dashboard/AcceptOrder.php?id="+id+"&message="+message+"&role="+2); 
        }

  
};
</script>

         <script>
function handleClick(cb,id,pd) {
	//alert("Clicked, new value = " + cb.checked);

  if(!cb.checked){
     if (confirm("Delete product! Are you sure?")) {
  window.location.replace("http://139.59.38.160/sendit/Dashboard/deleteProductID.php?id="+id+"&pd="+pd);
  } 
  }
}
</script>

<script type="text/javascript">

  function myOntheway(id) {

       var message=document.getElementById("onreason").value;
           //alert(message);
           var link="http://139.59.38.160/sendit/Dashboard/OntheWay.php?id="+id+"&message="+message;
           //alert(link);
window.location.replace(link);
  
};
</script>


</body>

</html>
