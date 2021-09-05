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

if (isset($_POST['Links'])){



$id=0;
 
 
$Links=$_POST["Links"];
$Links=test_input($Links);
     if (isset($_POST['Title'])){
$Title=$_POST["Title"];
$Title=test_input($Title);
}
$Details=$_POST["Details"];
$Details=test_input($Details);



$User= $_SESSION["email"];
$IP= $_SERVER['REMOTE_ADDR'];
$User= test_input($User);
$IP= test_input($IP);
$Photo= $_FILES['photo']['name'];
$Photo= test_input($Photo);

if(is)

$target_path = "policypic/";
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

     if (isset($_POST['id'])){
    $id=$_POST["id"];
     $user = $db->UpdatePolicy($id,$Details,$Links,$User,$IP,$Photo);
        if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
        header('Location: http://139.59.38.160/Groom/Dashboard/UpdatePolicy.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
        header('Location: http://139.59.38.160/Groom/Dashboard/NewPolicy.php');
    }
  }else{
     $user = $db->addPolicy($Title,$Details,$Links,$User,$IP,$Photo);
             if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
        header('Location: http://139.59.38.160/Groom/Dashboard/NewPolicy.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
          header('Location: http://139.59.38.160/Groom/Dashboard/NewPolicy.php');
    }

  }

 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
        header('Location: http://139.59.38.160/Groom/Dashboard/NewPolicy.php');
}
     echo json_encode($response); 
       


function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>