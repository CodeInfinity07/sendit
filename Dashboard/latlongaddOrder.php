<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.1/firebase-database.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


<script type="text/javascript">
 $(document).ready(function(){
    var unique ='<?php echo $_GET["id"];?>';

    var order ='<?php echo $_GET["Order"];?>';

    var address ='<?php echo $_GET["address"];?>';

    var From_Latitude ='<?php echo $_GET["From_Latitude"];?>';

    var From_Longitude ='<?php echo $_GET["From_Longitude"];?>';

    var ooo ='<?php echo $_GET["ooo"];?>';

    var mobile ='<?php echo $_GET["mobile"];?>';

    var res = unique.split(".");
    var uniqueID=res[0]+res[1];

   var regID ='<?php  echo $_GET['FirebaseToken'];?>';

      var msg =" Order Confirm";

    var Cost ='<?php echo $_GET["Cost"];?>';

  var config = {
      apiKey: "AIzaSyBzzKmQl07k5RZd4LaHpiXz_pWJZAghDzw",
    databaseURL: "https://sendit-291905.firebaseio.com/",
    projectId: "sendit-291905",
  };
  firebase.initializeApp(config);



              

                           var databaseFire1 = firebase.database().ref('sendit').child(uniqueID);
      databaseFire1.update({
      "Book_To_Latitude": From_Latitude,
          "Book_To_Longitude": From_Longitude,
              "From_Address": address,
                  "OTP": order,
                      "Payment": "1",
                          "UserMobile": mobile,
                              "con": uniqueID,
                                  "Order": ooo,
                                      "ask": "2",
           "Cost": Cost
                           }).then(function(){
                             var dataString =  'title='+ "Message from SendIt" +'&message='+msg+
                  '&push_type='+ "individual" +'&regId='+regID+
                  '&include_image='+ "FALSE" ;

                          var xmlhttp;
             
                  if (window.XMLHttpRequest) {
 
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

 xmlhttp.overrideMimeType("application/json");
 xmlhttp.open("POST","fcm_sent1.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(dataString);

   window.location.href = "http://139.59.38.160/sendit/Dashboard/Profile.php?id="+order;
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
          
  });
      

 
</script>



</head>

</html>
