<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.1/firebase-database.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


<script type="text/javascript">
 $(document).ready(function(){
  var damt=0;
 
        var message ='<?php echo $_GET["message"];?>';
            var orderid ='<?php echo $_GET["order"];?>';
                var status ='<?php echo $_GET["status"];?>';
                           
  var regID ='<?php  echo $_GET['FirebaseToken'];?>';
                       



    //alert(regID);



  var config = {
       apiKey: "AIzaSyBzzKmQl07k5RZd4LaHpiXz_pWJZAghDzw",
    databaseURL: "https://sendit-291905.firebaseio.com/",
    projectId: "sendit-291905",
  };
  firebase.initializeApp(config);



  
                         var dataString =  'title='+ "Status on parcel OrderID "+orderid +'&message='+message+
                  '&push_type='+ "individual" +'&regId='+regID+
                  '&include_image='+ "FALSE" ;


//alert(dataString);
        var xmlhttp;
             
                  if (window.XMLHttpRequest) {
 
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

   xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
         //alert(this.responseText);  
         window.location.href = "http://139.59.38.160/sendit/Dashboard/ProfileCourier.php?id="+orderid;

  }
}

 xmlhttp.overrideMimeType("application/json");
 xmlhttp.open("POST","fcm_sent1.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(dataString);
          

            

     
  
  });
      
                        
  

 
</script>



</head>

</html>
