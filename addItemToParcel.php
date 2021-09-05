<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);



var_dump($_POST);

if (isset($_POST['order'])){
 
  
    $orderid=isset($_POST['order']) ? $_POST['order'] : '';
    $orderid=test_input($orderid);
   
    $mmessage =$_POST['mmessage'];
    $mmessage=test_input($mmessage);


    $status =$_POST['status'];
    $status=test_input($status);


    $Price =$_POST['Price'];
    $Price=test_input($Price);


        $User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);
     
      
    $user = $db-> add_order_parcel($orderid,$mmessage,$status,$Price,$User,$IP);
      

        if ($user) {
            // user stored successfully
            $response["error"] = FALSE;
                $response["error"] = FALSE;
                  require_once 'DB_Connect.php';
        $dbs = new Db_Connect();
        $conn = $dbs->connect();

        $ID=0;
      

         $result =$conn->query("SELECT UserID FROM  courier WHERE OTP='$orderid'");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $ID=$row["UserID"];
            
        }
         }


              $result =$conn->query("SELECT Name,Phone_No,Photo, Firebase_Token FROM  user_details WHERE ID=$ID");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $Names=$row["Name"];
               $PhoneNo=$row["Phone_No"];
                        $FirebaseToken=$row["Firebase_Token"];
         
        }
         }
                $_SESSION["error"]=1;
                $response["error"] = false;
                 
      header('Location: http://139.59.38.160/sendit/Dashboard/latlongParcel.php?FirebaseToken='.$FirebaseToken.'&message='.$mmessage.'&order='.$orderid.'&status='.$status);
     
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