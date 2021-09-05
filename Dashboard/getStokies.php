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


 
$sql="SELECT `ID`, `Category`, `Name`, `Phone_No`, `Email`, `Aboutus`, `Address`, `State`, `City`, `Pin_No`, `Latitude`, `Longitude`, `Photo`, `Open_time`, `Close_time`, `Minimum_orders`, `Minimum_time`, `Discount`, `Rating`, `TotalRating`, `Popular`, `NewSeller`, `isActive`, `Date`, `Time` FROM `tez_Canteen` WHERE `ID`='$id'";
  	


$result = $con->query($sql);


  while ($user = mysqli_fetch_assoc($result)) {

$jsonRow_201=array(
               "ID"=>$user['ID'],
                     "Name"=>$user['Name'],
                "Phone_No"=>$user['Phone_No'],
                
                "Address"=>$user['Address'],
                         "Latitude"=>$user['Latitude'],

                          "Minimum_time"=>$user['Minimum_time'],
                         "Open_time"=>$user['Open_time'],
                            "Close_time"=>$user['Close_time'],
                         "Discount"=>$user['Discount'],
          
                "Longitude"=>$user['Longitude'],  
            "Email"=>$user['Email'],  
         
                "State"=>$user['State'],
          
                "City"=>$user['City'],  
                       
                "Pin"=>$user['Pin_No'],
              "Aboutus"=>$user['Aboutus'],
                          "Photo"=>$user['Photo'],     
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