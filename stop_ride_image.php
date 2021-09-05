<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
var_dump($_POST);
$response = array("error" => FALSE);
if (isset($_POST['User'])){
   
    $mobile = $_POST['mobile'];
       $User=$_POST['User'];
    $OTP = $_POST['OTP'];

            
   
    $mobile=test_input($mobile);
 

       $User=test_input($User);
    $OTP=test_input($OTP);
  
      
   


            $res = $db->stop_ride_image($mobile,$User,$OTP);

         if ($res) {
       
        $response["error"] = false;
      
    
    } else  {
        $response["error"] = true;
    
    }
 echo json_encode($response);
} else {
    // File parameter is missing
    $response['error'] = true;
    $response['message'] = 'Not received any file!';
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>