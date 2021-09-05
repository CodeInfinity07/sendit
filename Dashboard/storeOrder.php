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

            require_once 'DB_Connect.php';
            $dbc = new Db_Connect();
            $conn = $dbc->connect();

             $count=0;
             $count2=0;
             
             $text =$conn->query("SELECT s.ID,s.CanteenID,s.NoofItems,f.Name,f.JalpanPrice,f.Discount FROM `store_order` s INNER JOIN foods f ON f.ID=s.FoodID WHERE s.UserID='$usrID'AND s.OrderID='$orderid'");

             $cart = array();

               $result2 =$conn->query( "SELECT `Phone_No`,Firebase_Token FROM `user_details` WHERE `ID`='$usrID'");

               while($row2= $result2->fetch_assoc()) {
               
                        $usermobile=$row2["Phone_No"];
                        $FirebaseToken=$row["Firebase_Token"];
                            
                        } 

              while($row = $text->fetch_assoc()) {
                 
                        $price=($row["JalpanPrice"]-$row["Discount"]);
                        $cart[]=$row["ID"]."_".$row["NoofItems"]."_".$price."_".$row["Name"]."_".$row["CanteenID"];
                        $price=$row["NoofItems"]*($row["JalpanPrice"]-$row["Discount"]);
                        $Cost+=$price;
                        if($count!=$row["CanteenID"]){
                             $count=$row["CanteenID"];
                             $count2+=1;
                        }
                   
                        } 

                printf("Cost: %d.\n", $Cost);

                $Cost=$Cost+100+20*($count2-1);

                $update =$conn->query("UPDATE `update_user_order` SET `Gross`='$Cost',`Total`='$Cost' WHERE `UserID`='$usrID' AND `OrderID`='$orderid'");

                $update =$conn->query("UPDATE `book_ride` SET `Cost`='$Cost' WHERE `User_ID`='$usrID' AND `OTP`='$orderid' AND Is_Paid!=1 AND Ride_Cancelled_by=0 ");


            
            $ooo=implode(",",$cart);

             printf("ooo: %s.\n", $ooo);

            $result2 =$conn->query( "SELECT `Phone_No`,Firebase_Token FROM `user_details` WHERE `ID`='$usrID'");

               while($row2= $result2->fetch_assoc()) {
               
                        $usermobile=$row2["Phone_No"];
                        $FirebaseToken=$row2["Firebase_Token"];
                            
                        } 
      



           $up =$conn->query("UPDATE `orderimages` SET isDelivered=1 WHERE `OTP`='$orderid' AND `IDUser`='$usrID'");


      //  header('Location: http://139.59.38.160/sendit/Dashboard/sendPush.php?FirebaseToken='.implode("|",$token).'&msg='.$msg); 

         header('Location: http://139.59.38.160/sendit/Dashboard/latlongaddOrder.php?id='.$unique.'&Order='.$orderid.'&Cost='.$Cost.'&address='.$From_Address.'&From_Latitude='.$From_Latitude.'&From_Longitude='.$From_Longitude.'&ooo='.$ooo.'&mobile='.$usermobile.'&FirebaseToken='.$FirebaseToken);
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