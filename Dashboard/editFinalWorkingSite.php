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

if (isset($_POST['ID'])){


  $IDsubmenu=$_POST["IDsubmenu"];
$IDsubmenu=test_input($IDsubmenu);


$ID=$_POST["ID"];
$ID=test_input($ID);
 
$IDShop=$_POST["IDShop"];
$IDShop=test_input($IDShop);
 
$IDSubsubmenu=$_POST["IDSubsubmenu"];
$IDSubsubmenu=test_input($IDSubsubmenu);

 if (isset($_POST['vehicle1'])){
$vehicle1=$_POST["vehicle1"];
$vehicle1=test_input($vehicle1);
}else{
$vehicle1='0';
$vehicle1=test_input($vehicle1);
}
 
$Name=$_POST["Name"];
$Name=test_input($Name);

 
$Weight=$_POST["Weight"];
$Weight=test_input($Weight);

 
$Unit=$_POST["Unit"];
$Unit=test_input($Unit);
 


 
$Description=$_POST["Description"];
$Description=test_input($Description);





 
$MRP=$_POST["MRP"];
$MRP=test_input($MRP);
 
$JalpanPrice=$_POST["JalpanPrice"];
$JalpanPrice=test_input($JalpanPrice);

 
$Discount=$_POST["Discount"];
$Discount=test_input($Discount);
 



$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);

 if (isset($_FILES['photo']['name'])){
  $Photo= $_FILES['photo']['name'];
  $Photo= test_input($Photo);

$target_path = "http://139.59.38.160/sendit/Dashboard/products/";
        $target_path1 = $target_path . basename($_FILES['photo']['name']);

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

}else{
$Photo='';

}
 




  $user = $db->editWorkingSiteFinal($vehicle1,$IDsubmenu,$target_path1,$ID,$IDShop,$IDSubsubmenu,$Name,$Weight,$Unit,$Description,$MRP,$JalpanPrice,$Discount,$User,$IP);
             if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
      header('Location: http://139.59.38.160/sendit/Dashboard/edit_products.php?id='.$ID);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
      header('Location: http://139.59.38.160/sendit/Dashboard/edit_products.php?id='.$ID);
    }

 
 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
        header('Location: http://139.59.38.160/sendit/Dashboard/admin.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>