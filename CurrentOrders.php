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
    <title>Current</title>
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



 <script type="text/javascript">
function myFunction() {
  var myVarFromPhp = '<?php session_start();echo $_SESSION["email"] ?>';
  
  if(myVarFromPhp==''){
window.location.replace("http://139.59.38.160/sendit/Dashboard/page-login.php");
  }
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
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>
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
                            <li><a href="#">Orders</a></li>
                            <li class="active">Current Orders</li>
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
                          
                            <div class="card-body">
                                <div class="default-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Pending Orders</a>
                                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Accepted Orders</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Product updated</a>
                                             <a class="nav-item nav-link" id="nav-Dispatched-tab" data-toggle="tab" href="#nav-Dispatched" role="tab" aria-controls="nav-Dispatched" aria-selected="false">Driver Assigned</a>
                                            <a class="nav-item nav-link" id="nav-Delivered-tab" data-toggle="tab" href="#nav-Delivered" role="tab" aria-controls="nav-Delivered" aria-selected="false">Dispatched</a>
                                                 <a class="nav-item nav-link" id="nav-Product-tab" data-toggle="tab" href="#nav-Product" role="tab" aria-controls="nav-Product" aria-selected="false">Delivered</a>
                                        </div>
                                    </nav>
                                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                                   <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                               <th>Address</th>
                                                  <th>Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";
                          $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=0  GROUP BY d.ID");
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                           <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                        <td><?php echo "Pending";?></td>
<td> <a href="Profile.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                        </div>
                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                             <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                               <th>Address</th>
                                                  <th>Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";
                     $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=1 GROUP BY d.ID");
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                           <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                          <td><?php echo "Accepted";?></td>
<td> <a href="Profile.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                         
                                        </div>
                                        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                                     <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                                       <th>From Address</th>
                                            <th>From Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";

                              $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=2  GROUP BY d.ID");
                  
                     
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                                <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                          <td><?php echo "Confirmed";?></td>
<td> <a href="Profile.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                        </div>
                                                             <div class="tab-pane fade" id="nav-Dispatched" role="tabpanel" aria-labelledby="nav-Dispatched-tab">
                                                     <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                                       <th>From Address</th>
                                            <th>From Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";

                              $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=3  GROUP BY d.ID");
                  
                     
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                                <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                         <td><?php echo "Driver assigned";?></td>
<td> <a href="Profile.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                        </div>
                                                             <div class="tab-pane fade" id="nav-Delivered" role="tabpanel" aria-labelledby="nav-Delivered-tab">
                                                     <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                                       <th>From Address</th>
                                            <th>From Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";

                              $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=4  GROUP BY d.ID");
                  
                     
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                                <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                         <td><?php echo "Dispatched";?></td>
<td> <a href="Profile.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                        </div>
                                                    <div class="tab-pane fade" id="nav-Product" role="tabpanel" aria-labelledby="nav-Product-tab">
                                                     <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                                     <th>Sl No</th>
                                                          <th>Customer Name</th>
                                                              <th>Mobile No</th>
                                            <th>Order ID</th>
                                                       <th>From Address</th>
                                            <th>From Area</th>
                                            <th>Date</th>
                                        
                                            <th>Status</th>
                                              <th>Details</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>
                                               <?php
                      require_once 'DB_Connect.php';
                
                      $db = new Db_Connect();
                      $conn = $db->connect();
                        $date=date("Y-m-d");
                         $server_ip="139.59.38.160";

                              $users =$conn->query("SELECT s.ID,(SELECT From_area FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_area`,(SELECT From_Address FROM book_ride WHERE OTP=s.OrderID AND User_ID=s.UserID) AS `From_Address`,(SELECT Name FROM user_details WHERE ID=s.UserID) AS `UserID`,(SELECT Phone_No FROM user_details WHERE ID=s.UserID) AS `Mobile`,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID WHERE d.Delivered=5  GROUP BY d.ID");
                  
                     
                        if(!empty($users)): $count = 0; foreach($users as $user): $count++;
                    ?>
                    <tr>
                
                          <td><?php echo $count; ?></td>
                                            <td><?php echo $user['UserID']; ?></td>
                        <td><?php echo $user['Mobile']; ?></td>
                        <td><?php echo $user['OrderID']; ?></td>
                                <td><?php echo $user['From_Address']; ?></td>
                        <td><?php echo $user['From_area']; ?></td>
                        <td><?php echo $user['Date']; ?></td>
                         <td><?php echo "Delivered";?></td>
<td> <a href="ProfileDelivered.php?id=<?php echo $user["OrderID"];?>" style="color:blue;">Details</a></td>
                    </tr>
                    <?php endforeach; else: ?>
                    <tr><td colspan="5">No user(s) found......</td></tr>
                    <?php endif; ?>
                                    </tbody>
                                </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
          
                </div>




            </div><!-- .animated -->
        </div>            
                            
            </div>              
   
      
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


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
</body>
</html>
