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

$bulk= $_FILES['bulk']['name'];
$bulk= test_input($bulk);

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
     header('Location: http://139.59.38.160/sendit/Dashboard/AddbulkUpload_1.php');
    } else  {
            $_SESSION["error"]=2;
        $response["error"] = true;
     header('Location: http://139.59.38.160/sendit/Dashboard/AddbulkUpload_1.php?');
    }


} else {
     $_SESSION["error"]=2;
    $response['error'] = true;
   header('Location: http://139.59.38.160/sendit/Dashboard/AddbulkUpload_1.php?');
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