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
    var res = unique.split(".");
    var unique=res[0]+res[1];

      var Cost ='<?php echo $_GET["Cost"];?>';

  var config = {
      apiKey: "AIzaSyBzzKmQl07k5RZd4LaHpiXz_pWJZAghDzw",
    databaseURL: "https://sendit-291905.firebaseio.com/",
    projectId: "sendit-291905",
  };
  firebase.initializeApp(config);



              

                           var databaseFire1 = firebase.database().ref('sendit').child(unique);
      databaseFire1.update({
      "changed": "1",
           "Cost": Cost
                           }).then(function(){
   window.location.href = "http://139.59.38.160/sendit/Dashboard/Profile.php?id="+order;
}).catch(function(error) {
  alert("Data could not be saved." + error);
});
          
  });
      

 
</script>



</head>

</html>
