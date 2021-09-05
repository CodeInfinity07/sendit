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

if (isset($_POST['Name'])){



 
 
$Name=$_POST["Name"];
$Name=test_input($Name);




     $user = $db->addrequest($Name,$User,$IP);
             if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
      header('Location: http://139.59.38.160/Corona/Dashboard/AddRequests.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
          header('Location: http://139.59.38.160/FashClub/Dashboard/AddRequests.php');
    }

 
 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
        header('Location: http://139.59.38.160/FashClub/Dashboard/AddRequests.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>