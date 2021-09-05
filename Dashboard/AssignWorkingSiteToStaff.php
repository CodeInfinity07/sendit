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
    <title>Assign Working Site  To Staff</title>
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
window.location.replace("http://139.59.38.160/Ecosense/Dashboard/page-login.php");
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
                        <a href="index.php"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>

                      <h3 class="menu-title">WorkOrder</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Add Task</a>
                        <ul class="sub-menu children dropdown-menu">
                             <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AssignWorkingSiteToStaff.php">Assign Sites</a></li>
                               <li><i class="menu-icon fa fa-sign-in"></i><a href="PushNotification.php">Push Notification</a></li>
                                 <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="stafftracker.html">Google Map Track</a></li>
                        </ul>
                    </li>


                   
                   <h3 class="menu-title">Operation</h3>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Staff</a>
                        <ul class="sub-menu children dropdown-menu">
                             <li><i class="menu-icon fa fa-th"></i><a href="staff_registration.php">Registration</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="EditStaff.php">Edit</a></li>
                               <li><i class="menu-icon fa fa-th"></i><a href="DeleteStaff.php">Delete</a></li>
                        </ul>
                    </li>
         
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list"></i>Policy</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="NewPolicy.php">New</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="UpdatePolicy.php">Update</a></li>
                        </ul>
                    </li>

 
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-book"></i>Handbook</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="NewHandBook.php">New</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="UpdateHandBook.php">Update</a></li>
                        
                        </ul>
                    </li>

            
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-medkit"></i>Hailth & Safety</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="HealthSafety.php">New</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="UpdateHealthSafety.php">Update</a></li>
                        
                        </ul>
                    </li>

                 
    
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Staff training</a>
                        <ul class="sub-menu children dropdown-menu">
                              <li><i class="menu-icon fa fa-th"></i><a href="StaffTraining.php">New</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="UpdateStaffTraining.php">Update</a></li>
                           
                        </ul>
                    </li>

                     <h3 class="menu-title">Working Site</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="BookingReport.php" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-folder-open"></i>Edit Sites</a>
                        <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="WorkingSites.php">New Sites</a></li>
                    
                     <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="AssignWorkingSiteToStaff.php">Assign Sites</a></li>
                    
                        
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
                            <li><a href="#">Sites</a></li>
                            <li class="active">Assign Working Sites To Staff</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

    

                                          <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row" id="taken">
                   
          <div class="col-lg-6">
                              <form action="sendStaffCode.php" method="post" enctype="multipart/form-data" target="_self" >
                        <div class="card" >
                            <div class="card-header">
                                <strong class="card-title">Available WorkingSites</strong>
                            </div>  
                            <div class="card-body" >
                                           

          
                                                            <div class="row input-group">
                                                                    
                              <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Assign Staff </label></div>
                            <div class="col-6 col-md-6"><select  id="StaffID" name="StaffID"  class="input-sm form-control-sm form-control"   >
                          
                            <option value=" ">--Select--</option>

                                                                             <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        if(!$conn){
        echo "Could not connect to DBMS"; 
         }else {  $sql =$conn->query("SELECT  ID,`FirstName`,`LastName` FROM `admin_login_data` WHERE isStaff=1 AND isDeleted=0");
        foreach($sql as $row) {
    ?>

 <option value="<?php echo $row['ID']; ?>">  
                                         <?php 
                                      
                                         echo $row['FirstName'].$row['LastName'];?>  
   </option>  
                      <?php
}
}
?>

                                                                        </select>  </div>


                           
                            
                                                            </div>      <div class="row input-group">
                                                                <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Date</label></div>
                              <div class="col-6 col-md-6"><input type="date" id="Date" name="Date"  class="input-sm form-control-sm form-control" value="<?php echo date("Y-m-d");?>"></div>
                           
                                                            </div>
                                                                      
                                                                      <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Time</label></div>
                              <div class="col-6 col-md-6"><input type="time" id="time" name="time" class="input-sm form-control-sm form-control-file" value="<?php    date_default_timezone_set(TIMEZONE); echo date("H-i-s");?>"></div>
                       
                           
                        
                                                          
                                                            
                                                          </div>     
                                                              <div class="row input-group">
                                                                    
                             <div class="col col-md-3"><label for="text-input" class=" input-sm form-control-sm form-control-label">Message</label></div>
                              <div class="col-6 col-md-6"><textarea rows="4" type="text" id="msg" name="msg"  class="input-sm form-control-sm form-control" required></textarea></div>
                           
                                                            </div> 
                                                              
                       <div class="col col-md-6">
                        <div class="card-header">
                                <strong class="card-title">Available Sites</strong>
                            </div>                 
                                                                        <div class="form-check">
                                   <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        session_start();
        $email=$_SESSION["email"];
        if(!$conn){
        echo "Put manually"; 
         }else {  
      $sql =$conn->query("SELECT ID,Name FROM new_site WHERE  isActive=1  ");
        foreach($sql as $row1) {
            ?> <div class="checkbox">
                                    <label for="checkbox" class="form-check-label "><input type="checkbox" id="IssueToH" name="check_list[]"  class="form-check-input"  value="<?php echo $row1['ID'];?>" ></label> </div><?php
                    echo $row1['Name'];
                                     }

                
}
?>
                        
                           </div>
                                                            </div>
                                                        </div>
                                                   
                                                    </div>
                      
             
                
                                                         <button type="submit" class="btn btn-primary btn-lg btn-block" style="height: 56px;">
                                                            <i class="fa fa-angle-double-right"></i>
                                                        </button>
                                                                 </form>
                    </div>


                      <div class="col-lg-6" >
                      
                                                          
                        <div class="card"  id="given">
                            <div class="card-header">
                                <strong class="card-title">Assigned WorkingSites</strong>
                            </div>
                                <form action="deAssignPinCode.php" method="post" enctype="multipart/form-data" target="_self" >
                                 
                                             
                                             
             <div class="col-lg-6">
                         
                                                    <div class="form-check">
                                <?php  
                        
                                 require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();
        session_start();
        $email=$_SESSION["email"];
        if(!$conn){
        echo "Put manually"; 
         }else {  
                                      $sql =$conn->query("SELECT w.ID, s.Name,(SELECT FirstName from admin_login_data WHERE ID=w.StaffID) AS Staff FROM `workingsites` w INNER JOIN new_site s ON s.ID=w.SiteID WHERE w.isActive=1 AND w.StaffID!=0 ");
        foreach($sql as $row1) {
            ?>    <div class="checkbox">
                                                                                <label for="checkbox" class="form-check-label "><input type="checkbox" id="IssueToH" name="check_list[]"  class="form-check-input"  value="<?php echo $row1['ID'];?>"></label> </div><?php
                    echo $row1['Name']."-".$row1['Staff'];
                                     }

               
}
?>
                        
                           </div>  
                       
              </div>
                <button type="submit" class="btn btn-danger btn-lg btn-block" style="height: 56px; margin-top: 50px;">
                                                            <i class="fa fa-angle-double-left"></i> 
                                                        </button>
                                                    </form>

</div>


                </div>
            </div>
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
    <script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>

</body>
</html>
