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


$Description=$_POST["Description"];
$Description=test_input($Description);


$special=$_POST["special"];
$special=test_input($special);

 
 
$ID=$_POST["ID"];
$ID=test_input($ID);

$Name=$_POST["Name"];
$Name=test_input($Name);

$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);

$color=$_POST["color"];
$color=test_input($color);


$Photo= $_FILES['photo']['name'];
$Photo= test_input($Photo);


if(strlen($color)==0){
  $color="#FFFFFF";
}


 if(strlen($Photo)!=0){
$target_path = "Menu/";
        $target_path1 = $target_path . basename($_FILES['photo']['name']);
        $target_ = "http://139.59.38.160/sendit/Dashboard/".$target_path . basename($_FILES['photo']['name']);

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
    $target_='';
  }


     $user = $db->EditWorkingSite($ID,$Name,$special,$Description,$target_,$color,$User,$IP);
             if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
      header('Location: http://139.59.38.160/sendit/Dashboard/AddPrimaryService.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
      header('Location: http://139.59.38.160/sendit/Dashboard/AddPrimaryService.php');
    }

 
 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
    header('Location: http://139.59.38.160/sendit/Dashboard/AddPrimaryService.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>