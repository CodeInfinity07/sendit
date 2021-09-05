<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
 header('Content-Type: application/json');
 session_start();

require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);



if (isset($_GET['id'])){



 $pd=$_GET["pd"];
$pd=test_input($pd);



 
$id=$_GET["id"];
$id=test_input($id);

$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);





     $user = $db->DeleterProductFromOrder($id,$pd);
             if ($user) {  

              $Cost=0;

            $response["error"] = false;
            $unique=$user["Unique_Ride_Code"];
              $usrID=$user["User_ID"];
        $Cost=$user["Cost"];
       

          if($Cost!=0){
            header('Location: http://139.59.38.160/sendit/Dashboard/latlongChanged.php?id='.$unique.'&Order='.$id.'&Cost='.$Cost);
          }else{
                 $reason="Item on the cart not avaialble";
              header('Location: http://139.59.38.160/sendit/Dashboard/deleteFCM.php?unique='.$unique.'&reason='.$reason);
          }

       //
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
         // header('Location: http://139.59.38.160/sendit/Dashboard/Profile.php?id='.$id);
    }



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
      header('Location: http://139.59.38.160/sendit/Dashboard/Profile.php?id='.$id);
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>