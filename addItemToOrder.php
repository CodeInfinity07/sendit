<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);

echo "HI";

var_dump($_POST);

if (isset($_POST['order'])){
 
  
    $orderid=isset($_POST['order']) ? $_POST['order'] : '';
   
    $orderid=test_input($orderid);
   
    $foods =$_POST['foods'];
    $foods=test_input($foods);


    $vname =$_POST['vname'];
    $vname=test_input($vname);


    $quantity =$_POST['quantity'];
    $quantity=test_input($quantity);


    $User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);
     
      
    $user = $db-> add_order_image($orderid,$foods,$vname,$quantity,$User,$IP);
      

        if ($user) {
            // user stored successfully
            $response["error"] = FALSE;
                $response["error"] = FALSE;
        header('Location: http://139.59.38.160/sendit/Dashboard/ProfileImage.php?id='.$orderid);
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