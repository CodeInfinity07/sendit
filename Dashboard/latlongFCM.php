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
    var unique ='<?php echo $_GET["unique"];?>';
        var name ='<?php echo $_GET["name"];?>';
            var mobile ='<?php echo $_GET["mobile"];?>';
                var vehicle ='<?php echo $_GET["vehicle"];?>';
                            var ETR ='<?php echo $_GET["ETR"];?>';
                               var Photo ='<?php echo $_GET["Photo"];?>';
                                       damt ='<?php echo $_GET["damt"];?>';
  var regID ='<?php  echo $_GET['FirebaseToken'];?>';
                       

    var res = unique.split(".");
    var unique=res[0]+res[1];

    //alert(regID);



  var config = {
       apiKey: "AIzaSyBzzKmQl07k5RZd4LaHpiXz_pWJZAghDzw",
    databaseURL: "https://sendit-291905.firebaseio.com/",
    projectId: "sendit-291905",
  };
  firebase.initializeApp(config);


    if(damt>0){
  
                           var databaseFire1 = firebase.database().ref('sendit').child(unique);
      databaseFire1.update({
      "ask": "4",
       "driverName": name,
        "DriverMobile": mobile,
                 "ETR": ETR,
                      "image": Photo,
         "driverVehicle": vehicle,
            "pchanged": "1",
          "Cost": damt
                           }).then(function(){
     var databaseFire1 = firebase.database().ref('Driver_Online').child(mobile);
      databaseFire1.update({
      "Ride": unique
                           }).then(function(){
                         var dataString =  'title='+ "Message from sendit" +'&message='+"Order assinged! Please check pickup requests."+
                  '&push_type='+ "individual" +'&regId='+regID+
                  '&include_image='+ "FALSE" ;


alert(dataString);
        var xmlhttp;
             
                  if (window.XMLHttpRequest) {
 
    xmlhttp=new XMLHttpRequest();
  } else { 
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

   xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
         alert(this.responseText);  
         window.location.href = "http://139.59.38.160/sendit/Dashboard/admin.php";
  }
}

 xmlhttp.overrideMimeType("application/json");
 xmlhttp.open("POST","fcm_sent1.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(dataString);
          




   //window.location.href = "http://139.59.38.160/sendit/Dashboard/admin.php";
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
     
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
    }else{

                           var databaseFire1 = firebase.database().ref('sendit').child(unique);
      databaseFire1.update({
      "ask": "4",
       "driverName": name,
        "DriverMobile": mobile,
                 "ETR": ETR,
                      "image": Photo,
         "driverVehicle": vehicle
           
                           }).then(function(){
     var databaseFire1 = firebase.database().ref('Driver_Online').child(mobile);
      databaseFire1.update({
      "Ride": unique
                           }).then(function(){
                              var dataString =  'title='+ "Message from sendit" +'&message='+"Order assinged! Please check pickup requests."+
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
         alert("Success");  
         window.location.href = "http://139.59.38.160/sendit/Dashboard/admin.php";
  }
}

 xmlhttp.overrideMimeType("application/json");
 xmlhttp.open("POST","fcm_sent1.php",true);
 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
 xmlhttp.send(dataString);
            




   //window.location.href = "http://139.59.38.160/sendit/Dashboard/admin.php";
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
     
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
    }
              

     
  
  });
      
                        
  

 
</script>



</head>

</html>
