<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);


var_dump($_GET);

if (isset($_GET['id'])){
 
  
    $orderid=isset($_GET['id']) ? $_GET['id'] : '';
   
    $orderid=test_input($orderid);
   



    $User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);
     
      
    $user = $db-> comolete_order($orderid,$User,$IP);
      

        if ($user) {
            // user stored successfully
            $response["error"] = FALSE;
            $unique=$user["Unique_Ride_Code"];
            $usrID=$user["User_ID"];
            $Cost=$user["Cost"];
            $From_Latitude=$user["From_Latitude"];
            $From_Longitude=$user["From_Longitude"];
            $From_Address=$user["From_Address"];
         header('Location: http://139.59.38.160/sendit/Dashboard/latlongaddOrder.php?id='.$unique.'&Order='.$id.'&Cost='.$Cost);
        } else {
            // user failed to store
            $response["error"] = TRUE;
            $response["error_msg"] = "Failed!";
            echo json_encode($response);
        }
    
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters missing!";
    echo json_encode($response);
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>