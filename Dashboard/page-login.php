
<?php
session_start();
?>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>sendit  Dashboard</title>
    <meta name="description" content="Login">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


<style type="text/css">
	.centered {
  position: fixed;
  top: 50%;
  left: 50%;

  -webkit-transform: translate(-50%, -50%);
  
  

}
</style>
</head>

<body class="bg-dark"  style="background-image: url('bgimage.png'); background-repeat: no-repeat;background-size: cover; 
     height:100vh;     " >
    <?php
session_unset(); 
session_destroy(); 
?>


        <div class="content mt-3 centered col-sm-4">
            <div class="animated fadeIn">


                <div class="row">
          
                                                  

                  
                                              <div class="col-lg-12">
                                                 <div class="card">
                            <div class="card-body card-block">
                    <form action="login.php" method="post" target="_self">
                        <div class="form-group">
                            <label>User ID</label>
                            <input name="email" type="text" id="email" class="form-control" placeholder="User ID" required>
                        </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" id="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                               
                                <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                             
                         
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>


    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>

</html>
