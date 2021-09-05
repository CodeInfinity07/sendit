<?php
header('Content-Type: application/json');
        require_once 'DB_Connect.php';
  
        $db = new Db_Connect();
        $conn = $db->connect();

 
if(!$conn){
   echo "Could not connect to DBMS"; 
    }else { 



try{

  if(isset($_POST['id'])){
    $id=$_POST['id'];
    $id=test_input($id);
  }

       $date=date("Y-m-d");
  $response = array();

  
   $result =$conn->query("SELECT `ID`, `Name`, `Photo`, `isActive`, `Date`, `Time` FROM `subsubmenu` WHERE id='$id' ");
          
            while ($user1 = mysqli_fetch_assoc($result)) {

$jsonRow_201=array(
             
                          "ID"=>$user1["ID"],
                              "Name"=>$user1["Name"],
                                       
                               
                                 
 );

array_push($response, $jsonRow_201);
  
}
  

echo json_encode($response);
 


} catch(Error $e) {
    $trace = $e->getTrace();
    echo $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine().' called from '.$trace[0]['file'].' on line '.$trace[0]['line'];
}



}
 
    
 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>