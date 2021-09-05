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
    <title>Shipment Booking</title>
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
  document.getElementById('iddocs').style.display="none";
  if(myVarFromPhp==''){
window.location.replace("http://mypostman.in/Dashboard/page-login.php");
  }else{

          var xmlhttp;
          var id='id='+ myVarFromPhp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
          
         var arr = JSON.parse(this.responseText);
         var i;
             if(arr.length!=0){
                           
                               for( i=0;i<arr.length;i++){
                                  document.getElementById('Booked_By').value=arr[i].Name;
                                  document.getElementById('origin').value=arr[i].Origin;
                               }
             }
  }
}
 xmlhttp.open("POST","getFranchise.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);
  }
  
};
</script>
</head>

<body onload="myFunction()">


    <!-- Left Panel -->

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
                        <a href="index.php"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>

                     

                   
                 
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Operation</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="book_shipment.php">Shipment Booking </a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="AWBAcknowledgement.php">Existing AWB Acknowledgement</a></li>
                             <li><i class="menu-icon fa fa-th"></i><a href="ManifestEntry.php">Manifest Entry </a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="DeleteAwbNo.php">Existing Delete Awb No</a></li>
                             <li><i class="menu-icon fa fa-th"></i><a href="BagLocking.php">Bag Locking </a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="DispatchEntry.php">Dispatch Entry</a></li>
                             <li><i class="menu-icon fa fa-th"></i><a href="UpdateCDNo.php">Update CDNo </a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="ArrivalEntry.php">Arrival Entry</a></li>
                           
                        </ul>
                    </li>

                   
                 
                    <h3 class="menu-title">Login</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Client</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="ClientMaster.php">Client Master</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="ClientRateEntry.php">Client Rate Entry</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="GenerateRegularClientBill.php">Generate Regular Client Bill</a></li>
                              <li><i class="menu-icon fa fa-sign-in"></i><a href="ClientBillPrint.php">Client Bill Print</a></li>
                           
                        </ul>
                    </li>
                        <h3 class="menu-title">Query</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Awb No Query</a>
                        <ul class="sub-menu children dropdown-menu">
                                 <li><i class="menu-icon fa fa-sign-in"></i><a href="AwbNoQuery.php">Awb No Query</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="ReportQuery.php">Report Query</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="RouteDashboard.php">Route Dashboard</a></li>
                        
                        </ul>
                    </li>
                    <h3 class="menu-title">Reports</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="BookingReport.php" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i> Booking Report</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="ManifestBaggingReport.php"> Manifest Bagging Report</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="DispatchReport.php">Dispatch Report</a></li>
                          <li><i class="menu-icon fa fa-sign-in"></i><a href="ManifestBaggingInScanReport.php"> Manifest Bagging InScan</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="BoxInScanReport.php">Box InScan Report</a></li>
                             <li><i class="menu-icon fa fa-sign-in"></i><a href="RunsheetReport.php"> Runsheet Report</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="DeliveryStatusReport.php">Delivery Status Report</a></li>
            
                         
                        </ul>
                    </li>
                            <h3 class="menu-title">Franchise</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-address-book-o"></i> Franchise Operation</a>
                        <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="RegisterFranchise.php">Register Franchise</a></li>
                                 <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="EditFranchise.php">Edit Franchise</a></li>
                            <li><i class="menu-icon fa fa-trash-o"></i><a href="DeleteFranchise.php">Delete Franchise</a></li>
                        
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
    <!-- Left Panel -->

    <!-- Right Panel -->

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


        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Shipment Booking</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="index.php">Dashboard</a></li>
                            <li><a href="#">Operation</a></li>
                            <li class="active">Shipment Booking</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
          
                                                  

                  
                                            <div class="col-lg-12">
                                               
                                                    <div class="card-header">
                                                        <strong>Shipment Booking </strong>(Please Select Product Type First to get Min Unbooked AWBNo.)
                                                    </div>
                                                        <form action="shipment_booking.php" method="post" enctype="multipart/form-data" target="_self" class="form-horizontal">
                                                          


                                                <div class="card">
                                                  
                                               <div class="card-body card-block">
                                                    
                                                                          <div class="row input-group">
                                                                    <div class="col col-md-3"><label for="select" class=" input-sm form-control-sm form-control-label">Product Type</label></div>
                                                                    <div class="col-3 col-md-3">
                                                                               <select  id="Product_Type" name="Product_Type" class="input-sm form-control-sm form-control"  >
   <option value="0">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `Type` FROM `product_type` ");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Type'];?>  
   </option>  
                      <?php
}
}
?>

                                                                        </select>
                                                                    </div>
                                                                     <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Booking Date*</label></div>
                             <div class="col-3 col-md-3"><input type="Date" id="Booking_Date" name="Booking_Date"  class="input-sm form-control-sm form-control" required value="<?php echo date("Y-m-d");?>"></div>
                           
                                                                </div>
                                                                
                                                            
                                                
                                                    
                                                          <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Booked By</label></div>
                             <div class="col-3 col-md-3">  <input   name="Booked_By" id="Booked_By" type="text" class="input-sm form-control-sm form-control" readonly></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Fwd. Agent</label></div>
                             <div class="col-3 col-md-3">  <select  id="Fwd_Agent" name="Fwd_Agent" class="input-sm form-control-sm form-control"  >
   <option value="0">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `Category` FROM Fwd_Agent ");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Category'];?>  
   </option>  
                      <?php
}
}
?>
</select>
                                                                    </div>
</div>
                        
                                                            <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Origin</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="origin" name="origin"  class="input-sm form-control-sm form-control" readonly></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Forwarding No</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Forwarding_No" name="Forwarding_No"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                     
                                                                  <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Mode</label></div>
                             <div class="col-3 col-md-3">             <select  id="Mode" name="Mode" class="input-sm form-control-sm form-control"  >
   <option value="0">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `Type` FROM `mode` ");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Type'];?>  
   </option>  
                      <?php
}
}
?>

                                                                        </select></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Packet Type</label></div>
                             <div class="col-3 col-md-3"> <select  id="Packet_Type" name="Packet_Type" class="input-sm form-control-sm form-control"  >
   <option value="0">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `Type` FROM `packet_type` ");
        foreach($sql as $row) {AwbNo
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Type'];?>  
   </option>  
                      <?php
}
}
?>

                                                                        </select></div>
                           
                        
                                                            </div>
                                                                      <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">AWB No.*</label></div>
                            <div class="col-3 col-md-3"><input list="m6-datalist" id="AWB_No" name="AWB_No"  class="input-sm form-control-sm form-control" autocomplete="off"  onkeyup ="getPins(this.value)" required style="font-size: 14px;" >
                             <datalist id="m6-datalist" >
                             </datalist> 
                              
                         </div>
                          
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Service</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Service" name="Service"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                          
                                                              </div>
                                                            </div>
                                                  
                                                <div class="card">
                                                    <div class="card-header">
                                                        <strong>Consignor</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                                <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Client*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="ConsignorID" name="ConsignorID"  class="input-sm form-control-sm form-control" onkeypress="getCash(this.value)"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Consignor Name*</label></div>
                             <div class="col-3 col-md-3"><input list="m8-datalist" id="Consignor" name="Consignor"  class="input-sm form-control-sm form-control" autocomplete="off"  onkeyup ="myHint1(this.value)" required style="font-size: 14px;" onkeydown ="getAddress(this.value)">
                             <datalist id="m8-datalist" >
                             </datalist> 
                              
                         </div>
                       
                                                            </div>
                                                                       <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Address Line 1</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Address_line_1" name="Address_line_1"  class="input-sm form-control-sm form-control" required></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Addres Line 2</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Address_line_2" name="Address_line_2"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                                      <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Email ID</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Email1" name="Email1"  class="input-sm form-control-sm form-control"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Pin Code</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Pin1" name="Pin1"  class="input-sm form-control-sm form-control" required></div>
                           
                        
                                                            </div>
                                                            <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Ref No.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Ref_No1" name="Ref_No1"  class="input-sm form-control-sm form-control"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Mobile No.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Mobile1" name="Mobile1"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                             <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Invoice No.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Invoice_No" name="Invoice_No"  class="input-sm form-control-sm form-control"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Invoice Value</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Invoice_value" name="Invoice_value"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                              <div class="row input-group" id="iddocs">
                                                                    
                             <div class="col col-md-3" ><label  for="text-input" class=" input-sm form-control-sm form-control-label">ID&nbspproof</label></div>
                             <div class="col-3 col-sm-3" ><select  id="IDdocs" name="IDdocs" class="input-sm form-control-sm form-control" value=0> <option value="0">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT `ID`, `Proof` FROM `idProof` ");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['Proof'];?>  
   </option>  
                      <?php
}
}
?>

                                                                        </select></div>
                             <div class="col-6 col-sm-6" ><input   type="text" id="IDNo" name="IDNo" placeholder="No" class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                          </div>
                                                      </div>


                                    <div class="card">
                                                    <div class="card-header">
                                                        <strong>Consignee</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                                <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Consignee Name*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Consignee" name="Consignee"  class="input-sm form-control-sm form-control" required></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Email ID</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Email2" name="Email2"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                                       <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Address Line 1</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Address_line_3" name="Address_line_3"  class="input-sm form-control-sm form-control"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Addres Line 2</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Address_line_4" name="Address_line_4"  class="input-sm input-sm form-control-sm form-control-sm input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                                      <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Mobile No.*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Mobile2" name="Mobile2"  class="input-sm form-control-sm form-control" required></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Phone No.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="PhoneNo2" name="PhoneNo2"  class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                            <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Pin Code*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Pin2" name="Pin2"  class="input-sm form-control-sm form-control" required></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Destination*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Destination" name="Destination"  class="input-sm form-control-sm form-control" required></div>
                           
                        
                                                            </div>
                                                           
                                                          </div>
                                                      </div>

                                                    <div class="card">
                                                
                                                    <div class="card-header">
                                                        <strong>Extra Charge Details</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                                <div class="row input-group">
                                                                    
                            <div class="col-6 col-md-6"><input type="text" id="text-input" name="Extra_Charge_Description" id="Extra_Charge_Description " placeholder="Description" class="input-sm form-control-sm form-control"></div>
                           
                             <div class="col-6 col-md-6"><input type="text" id="text-input" name="Extra_Charge" name="Extra_Charge" placeholder="Charge" class="input-sm form-control-sm form-control"></div>
                               
                        
                                                           
                                                          </div>
                                                      </div>
                                                </div>
                                                  <div class="card">
                                                
                                                    <div class="card-header">
                                                        <strong>Weight details</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                                 <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Packets</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Packets" name="Packets"  class="input-sm form-control-sm form-control"></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Actual Wt.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Actual_wt" name="Actual_wt"  class="input-sm form-control-sm form-control" onkeydown="getKartRate(this.value)"></div>
                           
                        
                                                            </div>
                                                      </div>
                                                </div>
                                                
                                               <div class="card">
                                                    <div class="card-header">
                                                        <strong>Payment Details</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                                <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Pmt. Mode</label></div>
                             <div class="col-3 col-md-3"> <select name="pmtMode" id="pmtMode" class="input-sm form-control-sm form-control" onchange="myHide(this.value);">
                                                                            <option value="0">Please select</option>
                                                                            <option value="1">CASH</option>
                                                                            <option value="2">TO PAY</option>
                                                                        </select></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Amt</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Amt" name="Amt" placeholder="0" class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                                       <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Freight</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Freight" name="Freight" placeholder="0" class="input-sm form-control-sm form-control" value=0></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Fuel</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Fuel" name="Fuel" placeholder="0" class="input-sm form-control-sm form-control"></div>
                           
                        
                                                            </div>
                                                                      <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">FOV</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="FOV" name="FOV" placeholder="0" class="input-sm form-control-sm form-control" value=0 ></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Other</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Other" name="Other" placeholder="0" class="input-sm form-control-sm form-control" value="0"></div>
                           
                        
                                                            </div>
                                                            <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Sub Total</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Sub_Total" name="Sub_Total" placeholder="0" class="input-sm form-control-sm form-control" value=0></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">GST*</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="GST" name="GST" placeholder="0" class="input-sm form-control-sm form-control" required></div>
                           
                        
                                                            </div>
                                                                <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Payable</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Payable" name="Payable" placeholder="0" class="input-sm form-control-sm form-control"></div>
                          
                           
                        
                                                            </div>
                                                           
                                                          </div>
                                                      </div>
                         
   <div class="card">
        <div class="card-body card-block">
                                                            <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Dim. Wt.</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Dim_wt" name="Dim_wt" placeholder="0" value=0></div>
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Billed Wt</label></div>
                             <div class="col-3 col-md-3"><input type="text" id="Billed_wt" name="Billed_wt" value=0 placeholder="0" ></div>
                           
                        </div>
                                                            </div>
                                                  </div>
                                                     <div class="card">
                                                    <div class="card-footer">
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-dot-circle-o"></i> Submit
                                                        </button>
                                                        <button type="reset" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-ban"></i> Reset
                                                        </button>
                                                    </div>
                                              </div>
                                                          </form>
                                                          
                                                </div>
                                               
                                           
                                        

                                         
                                         
                                          
                                            </div>
                                        </div><!-- .animated -->
                                    </div><!-- .content -->
                                </div><!-- /#right-panel -->
                                <!-- Right Panel -->
  <script type="text/javascript">
function getPins(value) {
var options = "";
var id='id='+ value;
var dataList6 = document.getElementById('m6-datalist');
var request = new XMLHttpRequest();
request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
var jsonOptions = JSON.parse(request.responseText, (key, value) => {
  console.log(key); 
  console.log(value);  
   var option = document.createElement('option'); 
        if(value.length!=="" && value.length>4){
  options += '<option value="'+value+'" />';
  dataList6.innerHTML = options;   
}
});
    } 
  }
};
request.open('POST', 'getAssignPins.php', true);
request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
request.send(id);
};
 </script>

                                  <script type="text/javascript">
function getCash(value) {



if(value="."){


var res = ("CASH");
	//document.getElementById('ConsignorID').reset();
	document.getElementById('ConsignorID').value=res;
	document.getElementById('iddocs').style.display="block";
}else{
		document.getElementById('iddocs').style.display="none";
}
    

};
 </script>
<script type="text/javascript">
function myHint(value) {
var options = "";
var id='id='+ value;

var dataList7 = document.getElementById('m7-datalist');

var bookingdate = document.getElementById('bookingdate').value;

var Fwd_Agent = document.getElementById('Fwd_Agent');
Fwd_Agent.value="SELF:SELF";

var Service = document.getElementById('Service');
Service.value="SELF:SELF";

if(bookingdate==''){
    alert("Select a date");
}

var options = '';
var request = new XMLHttpRequest();

request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
  
var jsonOptions = JSON.parse(request.responseText, (key, value) => {
  

  console.log(key); 
console.log(value);  
   var option = document.createElement('option'); 
        if(value.length!=="" && value.length>4){
  options += '<option value="'+value+'" />';
  dataList7.innerHTML = options;
}
 
});
  

    } 
  }
};
request.open('POST', 'get_booked_by.php', true);
request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
request.send(id);
    

};
 </script>
  <script type="text/javascript">
function myHint1(value) {

var options = "";
var id='id='+ value;
var dataList8 = document.getElementById('m8-datalist');

var options = '';
var request = new XMLHttpRequest();

request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
  
var jsonOptions = JSON.parse(request.responseText, (key, value) => {
  
  console.log(key); 
console.log(value);  
   var option = document.createElement('option'); 
        if(value.length!=="" && value.length>1){
  options += '<option value="'+value+'" />';
  dataList8.innerHTML = options;   
}
 
});
  

    } 
  }
};
request.open('POST', 'getClient.php', true);
request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
request.send(id);
    

};
 </script>
   <script type="text/javascript">
function getAddress(value) {
var id='id='+ value;
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
                                  document.getElementById('Address_line_1').value=arr[i].Address_Line_1;
                                  document.getElementById('Address_line_2').value=arr[i].Address_Line_2;
                                  document.getElementById('Email1').value=arr[i].Email;
                                  document.getElementById('Pin1').value=arr[i].Pin;
                                  document.getElementById('ConsignorID').value=arr[i].Code;
                                  document.getElementById('Mobile1').value=arr[i].PhoneNo;
                               }
             }else{
               document.getElementById('Address_line_1').value='';
                                  document.getElementById('Address_line_2').value='';
                                  document.getElementById('Email1').value='';
                                  document.getElementById('Pin1').value='';
                                  document.getElementById('ConsignorID').value="CASH.";
                                  document.getElementById('Mobile1').value='';
             }
  }
}
 xmlhttp.open("POST","getClientAddress.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);

};
 </script>

    <script type="text/javascript">
function getKartRate(value) {

  

var From=document.getElementById("Pin1").value;
var To=document.getElementById("Pin2").value;
var Packets=document.getElementById("Packets").value;
var Packet_Type=document.getElementById("Packet_Type").value;
var Mode=document.getElementById("Mode").value;
var Actual_wt=document.getElementById("Actual_wt").value;
var Other=document.getElementById("Other").value;
  if(From!=''){
  	  if(To!=''){
  	  if(Packets!=''){
  	  if(Mode!=''){
  	  if(Actual_wt!=''){
  	var id='From='+From+"&To="+To+'&Packets='+Packets+'&Packet_Type='+Packet_Type+'&Mode='+Mode+'&Actual_wt='+Actual_wt;

 var fuels=0;
  var cost=0;

 var xmlhttp;
    if (window.XMLHttpRequest) {
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function() {
 
    if (this.readyState==4 && this.status==200) {
    
         var arr = JSON.parse(this.responseText);
         
         var i;
             if(arr.length!=0){
                           
                               for( i=0;i<arr.length;i++){
                                  document.getElementById('Amt').value=arr[i].cost;
                                   fuels=parseFloat(Math.round(arr[i].cost/10)).toFixed(2);;
                                     cost=arr[i].cost;
                               }
                                
                               document.getElementById('Fuel').value=fuels 
                                    document.getElementById('Sub_Total').value=parseFloat(fuels)+parseFloat(cost); 
                               var GSTs=parseFloat(Math.round((parseFloat(cost)+parseFloat(fuels))*0.18)).toFixed(2);;
                                document.getElementById('GST').value=GSTs;
                                      document.getElementById('Payable').value=parseFloat(cost)+parseFloat(fuels)+parseFloat(GSTs)+parseFloat(Other);
             }
  }
}
 xmlhttp.open("POST","getKartRate.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(id);
  }
  }else{
  	alert("Please add Mode");
  }
  }else{
  	alert("Please add No of packets");
  }
  }else{
  	alert("Please add Consignee Pin code");
  }
  }else{
  	alert("Please add Consignor Pin code");
  }



};
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
