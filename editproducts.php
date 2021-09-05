<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
 header('Content-Type: application/json');
 session_start();

require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);

var_dump($_POST);

if (isset($_POST['IDShop'])){


$id=$_POST["ID"];
$id=test_input($id);





 
$Name=$_POST["Name"];
$Name=test_input($Name);



  
$IDSubsubmenu=$_POST["IDShop"];
$IDSubsubmenu=test_input($IDSubsubmenu);

 
$Description=$_POST["Description"];
$Description=test_input($Description);



 
$MRP=$_POST["MRP"];
$MRP=test_input($MRP);
 
$Price=$_POST["Price"];
$Price=test_input($Price);

 
$Discount=$_POST["Discount"];
$Discount=test_input($Discount);
 



$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);





$Photo= $_FILES['photo']['name'];



$Photo= test_input($Photo);

$ttt="products/";


        $target_path1 = $ttt . basename($_FILES['photo']['name']);
        $target_path = "http://139.59.38.160/sendit/Dashboard/products/". basename($_FILES['photo']['name']);

        try {
        // Throws exception incase file is not being moved
        if (!move_uploaded_file($_FILES['photo']['tmp_name'], $target_path1)) {
            // make error flag true
            $response['error'] = true;
            $response['message'] = 'Could not move the file!';
        }
      }  catch (Exception $e) {
        // Exception occurred. Make error flag true
        $response['error'] = true;
        $response['message'] = $e->getMessage();
    }


  $user = $db->addWorkingSiteFinal_edit($id,$IDSubsubmenu,$Name,$Description,$MRP,$Price,$Discount,$target_path,$User,$IP);
             if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
      header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
          header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    }

 
 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
       // header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>