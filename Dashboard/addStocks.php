<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
 header('Content-Type: application/json');
 session_start();

require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);

var_dump($_POST);

if (isset($_POST['stokies'])){



$id=0;
 
 
$stokies=$_POST["stokies"];
$stokies=test_input($stokies);

$item=$_POST["item"];
$item=test_input($item);

$Unit=$_POST["Unit"];
$Unit=test_input($Unit);

$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);




     $user = $db->addStocktoStokies($stokies,$item,$Unit,$User,$IP);
        if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
        header('Location: http://139.59.38.160/FashClub/Dashboard/AddStockToStockies.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
      header('Location: http://139.59.38.160/FashClub/Dashboard/AddStockToStockies.php');
    }


 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
        header('Location: http://139.59.38.160/FashClub/Dashboard/AddStockToStockies.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>