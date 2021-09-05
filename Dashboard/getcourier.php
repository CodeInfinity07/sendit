<?php


header('Content-Type: application/json');
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $con = $db->connect();





if(!$con){
   echo "Could not connect to DBMS";       
 }else {


   $id=$_POST["id"];
   $id=test_input($id);



  $response = array();


 
$sql="SELECT `ID`, `OTP`,(SELECT Name FROM user_details WHERE ID=c.UserID) AS  `Name`, `DriverID`, PickDate,`PickUp`, `DropOff`, `Comment`,Message, `pLat`, `pLong`, `dLat`, `dLong`, `Type`, `Weight`, `Status`, `Price`, `Date`, `Time` FROM `courier` c WHERE c.OTP='$id' ";
  	


$result = $con->query($sql);


  while ($user = mysqli_fetch_assoc($result)) {

$jsonRow_201=array(
           "ID"=>$user['ID'],
                 "OTP"=>$user['OTP'],
                     "Name"=>$user['Name'],
                    "PickUp"=>$user['PickUp'],
                     "DropOff"=>$user['DropOff'],
                         "pLong"=>$user['pLong'],
                     "pLat"=>$user['pLat'],
                                 "dLong"=>$user['dLong'],
                     "dLat"=>$user['dLat'],
                                     "Type"=>$user['Type'],
                     "Weight"=>$user['Weight'],
                                     "Price"=>$user['Price'],
                     "Comment"=>$user['Comment'],
                       "Status"=>$user['Status'],
                             "Message"=>$user['Message'],
                       "Price"=>$user['Price'],
                        "Date"=>$user['PickDate'],
             );


array_push($response, $jsonRow_201);

}




 echo json_encode($response);


}


 

 
 function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}     



?>