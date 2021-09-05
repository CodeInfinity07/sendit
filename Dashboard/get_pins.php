<?php


session_start();
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: http://mypostman.in');
        require_once 'DB_Connect.php';
  
        $db = new Db_Connect();
        $conn = $db->connect();

 
if(!$conn){
   echo "Could not connect to DBMS"; 
    }else { 

if (isset($_POST['id'])){
 
    $pin= $_POST['id'];
   
    $pin=test_input($pin);



try{


  $response = array();

    $_SESSION["from"]='';
    $_SESSION["pass"]=0;
    



 $result =$conn->query("SELECT `Name` FROM `foods` WHERE  Name LIKE '$pin%' LIMIT 7 ");
          
       

          while ($user1 = mysqli_fetch_assoc($result)) {

$jsonRow_201=array(
             
                             "name"=>$user1["Name"],
                            
                           
                               
                                 
 );

array_push($response, $jsonRow_201);
  
}
echo json_encode($response);
 


} catch(Error $e) {
    $trace = $e->getTrace();
    echo $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine().' called from '.$trace[0]['file'].' on line '.$trace[0]['line'];
}
}else{
  header("Location: http://mypostman.in/"); 

}


}
 
    
 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>