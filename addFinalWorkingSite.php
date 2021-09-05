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

   $hour=date("H:i:s");
$date=date("Y-m-d");

if (isset($_POST['IDSubsubmenu'])){


$id=$_POST["id"];
$id=test_input($id);


$IDsubmenu="";
$IDsubmenu=test_input($IDsubmenu);
 
$IDSubsubmenu=$_POST["IDSubsubmenu"];
$IDSubsubmenu=test_input($IDSubsubmenu);

 
$Brand="";
$Brand=test_input($Brand);
 
$Name=$_POST["Name"];
$Name=test_input($Name);



 
$Weight="";
$Weight=test_input($Weight);

 
$Unit="";
$Unit=test_input($Unit);
 

 
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


 if (isset($_POST['vehicle1'])){
$vehicle1=$_POST["vehicle1"];
$vehicle1=test_input($vehicle1);
}else{
  $vehicle1='0';
$vehicle1=test_input($vehicle1);
}
 


$Photo= $_FILES['photo']['name'];
$Photo= test_input($Photo);


$bulk= $_FILES['bulk']['name'];
$bulk= test_input($bulk);

$ttt="products/";


        $target_path1 = $ttt . basename($_FILES['bulk']['name']);
        $target_path = "http://139.59.38.160/sendit/Dashboard/products/". basename($_FILES['bulk']['name']);

        try {
        // Throws exception incase file is not being moved
        if (!move_uploaded_file($_FILES['bulk']['tmp_name'], $target_path1)) {
            // make error flag true
            $response['error'] = true;
            $response['message'] = 'Could not move the file!';
        }
      }  catch (Exception $e) {
        // Exception occurred. Make error flag true
        $response['error'] = true;
        $response['message'] = $e->getMessage();
    }





    if(!empty($bulk)){

        require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $conn = $db->connect();

          $ttt="products/";
          $file = $ttt . basename($_FILES['bulk']['name']);
          $handle = fopen($file, "r") or die("can't open file");



          $c = $error = 0;





      while(($filesop = fgetcsv($handle))  !== FALSE)
                    {
          $IDCanteen = $filesop[0];
          $IDMenu = RemoveSpecialChar($filesop[1]);
          $Name = RemoveSpecialChar($filesop[2]);
          $Description = RemoveSpecialChar($filesop[3]);
          $JalpanPrice = RemoveSpecialChar($filesop[4]);
          $Photo = RemoveSpecialChar($filesop[5]);
                  
          
       
          $sql = "INSERT INTO `foods`(`IDCanteen`, `IDMenu`, `Name`, `Description`, `JalpanPrice`, `Photo`, `Date`, `Time`) VALUES  ('$IDCanteen','$IDMenu','$Name','$Description','$JalpanPrice','$Photo','$date','$hour')";
        // $notification=mysqli_query($conn, $sql);

          if (!$conn -> query($sql)) {
           echo("Error description: " . $conn -> error);
           $error=$conn -> error;
            }


          $c = $c + 1;
           }

     $upload_dir = 'products/';
    $allowed_types = array('jpg', 'png', 'jpeg', 'gif');
      
    // Define maxsize for files i.e 2MB
    $maxsize = 2 * 1024 * 1024; 
  
    // Checks if user sent an empty form 
    if(!empty(array_filter($_FILES['files']['name']))) {
  
        // Loop through each file in files[] array
        foreach ($_FILES['files']['tmp_name'] as $key => $value) {
              
            $file_tmpname = $_FILES['files']['tmp_name'][$key];
            $file_name = $_FILES['files']['name'][$key];
            $file_size = $_FILES['files']['size'][$key];
            $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
  
            // Set upload file path
            $filepath = $upload_dir.$file_name;
  
            // Check file type is allowed or not
            if(in_array(strtolower($file_ext), $allowed_types)) {
  
                // Verify file size - 2MB max 
                if ($file_size > $maxsize)         
                    echo "Error: File size is larger than the allowed limit."; 
  
                // If file with name already exist then append time in
                // front of name of the file to avoid overwriting of file
                if(file_exists($filepath)) {
                    $filepath = $upload_dir.time().$file_name;
                      
                    if( move_uploaded_file($file_tmpname, $filepath)) {
                        echo "{$file_name} successfully uploaded <br />";
                    } 
                    else {                     
                        echo "Error uploading {$file_name} <br />"; 
                    }
                }
                else {
                  
                    if( move_uploaded_file($file_tmpname, $filepath)) {
                        echo "{$file_name} successfully uploaded <br />";
                    }
                    else {                     
                        echo "Error uploading {$file_name} <br />"; 
                    }
                }
            }
            else {
                  
                // If file extention not valid
                echo "Error uploading {$file_name} "; 
                echo "({$file_ext} file type is not allowed)<br / >";
            } 
        }
    } 
    else {
          
        // If no files selected
        echo "No files selected.";
    }

     if ($error==0) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
     header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
     header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    }



    }else{
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


  $user = $db->addWorkingSiteFinal($id,$vehicle1,$IDsubmenu,$IDSubsubmenu,$Brand,$Name,$Weight,$Unit,$Description,$MRP,$Price,$Discount,$target_path,$User,$IP);

     if ($user) {  
          $_SESSION["error"]=1;
        $response["error"] = false;
     // header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
       //   header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php?id='.$id);
    }

    }





          
 
 

    



} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
       // header('Location: http://139.59.38.160/sendit/Dashboard/AddFinalService.php');
}
     echo json_encode($response); 
       
function RemoveSpecialChar($str) {
  
    $res = str_replace( array( '\'', '"',
    ',' , ';', '<', '>' ), ' ', $str);
      
    // Returning the result 
    return $res;
    }

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>