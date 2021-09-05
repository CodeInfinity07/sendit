db<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
 header('Content-Type: application/json');
 session_start();

require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);

var_dump($_POST);

if (isset($_POST['Name'])){

$mtime=$discount=0;

$otime="5:00";
$ctime="8:00";

if (isset($_POST['mtime'])){

$mtime=$_POST["mtime"];
$mtime=test_input($mtime);
}

if (isset($_POST['otime'])){

$otime=$_POST["otime"];
$otime=test_input($otime);
}

if (isset($_POST['ctime'])){

$ctime=$_POST["ctime"];
$ctime=test_input($ctime);
}

if (isset($_POST['discount'])){

$discount=$_POST["discount"];
$discount=test_input($discount);
}


$Name=$_POST["Name"];
$Name=test_input($Name);

$address=$_POST["address"];
$address=test_input($address);

$category=$_POST["category"];
$category=test_input($category);



$about=$_POST["about"];
$about=test_input($about);

$phone=$_POST["phone"];
$phone=test_input($phone);

$email=$_POST["email"];
$email=test_input($email);


$state=$_POST["state"];
$state=test_input($state);



$Pin=$_POST["Pin"];
$Pin=test_input($Pin);

$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);

$Latitide=$_POST["Latitude"];
$Latitide=test_input($Latitide);

$Longitude=$_POST["Longitude"];
$Longitude=test_input($Longitude);


$Photo= $_FILES['photo']['name'];
$Photo= test_input($Photo);

        if(strlen($Photo)!=0){
        $target_path1 = "http://139.59.38.160/sendit/Dashboard/images/" . basename($_FILES['photo']['name']);
         $target_path = "images/";
        $target_path = $target_path . basename($_FILES['photo']['name']);

        try {
        // Throws exception incase file is not being moved
        if (!move_uploaded_file($_FILES['photo']['tmp_name'], $target_path)) {
        
        }else{

        }

     $user = $db->postStockies($otime,$ctime,$mtime,$discount,$category,$about,$email,$Latitide,$Longitude,$Name,$phone,$address,$state,$target_path1,$Pin,$User,$IP);
    if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
  
     header('Location: http://139.59.38.160/sendit/Dashboard/AddStockies.php?id='.$ID);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
     header('Location: http://139.59.38.160/sendit/Dashboard/AddStockies.php');
    }


      }  catch (Exception $e) {
        // Exception occurred. Make error flag true
        $response['error'] = true;
        $response['message'] = $e->getMessage();
    }
  }else{
      $Photo="";
      $Photo=test_input($Photo);
      $user = $db->postStockies($otime,$ctime,$mtime,$discount,$category,$about,$email,$Latitide,$Longitude,$Name,$phone,$address,$state,$Photo,$Pin,$User,$IP);

    if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
  
  header('Location: http://139.59.38.160/sendit/Dashboard/AddStockies.php?id='.$ID);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
    header('Location: http://139.59.38.160/sendit/Dashboard/AddStockies.php');
    }

  }



           

  


} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
     // header('Location: http://139.59.38.160/sendit/Dashboard/AddStockies.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>