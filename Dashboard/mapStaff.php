
<!DOCTYPE html>
<html>
    <head>

        <style>
            #map {
                height: 100%;
            }
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #over_map {
                position: absolute;
                top: 10px;
                left: 50%;
                z-index: 99;
                background-color: #ccffcc;
                padding: 10px;
            }
        </style>
    </head>

    <body>
        <div id="map"></div>

        <div id="over_map">
            <div>
                <span>Name: </span><span id="staff"></span>
            </div>
             <div>
                <span>Site Name: </span><span id="site"></span>
            </div>
             <div>
                <span>Entered Site: </span><span id="enter"></span>
            </div>
              <div>
                <span>Exited Site: </span><span id="exit"></span>
            </div>
             <div>
                <span>Working at  Site: </span><span id="Working"></span>
            </div>
        </div>

        <script src="https://www.gstatic.com/firebasejs/4.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.1/firebase-database.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Firebase -->

        <script>
            var myVarFromPhp = '<?php echo $_GET["id"] ?>';

            var config = {
                apiKey: "AIzaSyAcGFoFMNeRuyykA_LypQBifSLM93KZBBw",
    databaseURL: "https://ecosense.firebaseio.com/",
    projectId: "ecosense",
            };
            firebase.initializeApp(config);
        </script>

        <script>
            // counter for online cars...
            var staffcount = 0;
            // markers array to store all the markers, so that we could remove marker when any car goes offline and its data will be remove from realtime database...
            var markers = [];
            var map;
             var marker;
               var image = 'http://139.59.38.160/Ecosense/human.png';
            function initMap() { // Google Map Initialization... 
                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 16,
                    center: new google.maps.LatLng(26.094040, 91.791473),
                    mapTypeId: 'terrain'
                });
                 marker = new google.maps.Marker({
                    position: new google.maps.LatLng(26.094040, 91.791473),
                    icon: image,
                    map: map
                });
            }
              
            // This Function will create a car icon with angle and add/display that marker on the map
            function AddStaff(data) {
               
             
                  
      
                    var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Staff Name</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Name </b>'+ data.val().Name
      '</div>'+
      '</div>';

 var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

 var center1 = new google.maps.LatLng(data.val().pLatitude, data.val().pLongitude);  
      var circle = new google.maps.Circle({
            center: center1,
            map: map,
            radius: 200,          // IN METERS.
            fillColor: '#FF6600',
            fillOpacity: 0.3,
            strokeColor: "#FF6347",
            strokeWeight: 2         // DON'T SHOW CIRCLE BORDER.
        });


          
           changeMarkerPosition(marker,data.val().MyLat, data.val().MyLong);
              map.panTo( new google.maps.LatLng(data.val().MyLat, data.val().MyLong) );

              
                markers[data.key] = marker; // add marker in the markers array...
                document.getElementById("staff").innerHTML = data.val().Name;
                 document.getElementById("site").innerHTML = data.val().Site;

                 if(data.val().Working==0){
                     document.getElementById("Working").innerHTML = "No";
                 }else{
                   document.getElementById("Working").innerHTML = "Yes";
                 }
                  if(data.val().Enter==0){
                     document.getElementById("enter").innerHTML = "No";
                 }else{
                   document.getElementById("enter").innerHTML = "Yes";
                 }
                  if(data.val().Exit==0){
                     document.getElementById("exit").innerHTML = "No";
                 }else{
                   document.getElementById("exit").innerHTML = "Yes";
                 }
                 marker.addListener('click', function() {
          infowindow.open(map, marker);
      
        });
             
            
        }
            // get firebase database reference...
            var staff_ref =  firebase.database().ref('Staff').child(myVarFromPhp);
  staff_ref.on('value', function(childSnapshot) {


       staffcount++;
      
                  AddStaff(childSnapshot);

        
          });


  function changeMarkerPosition(marker,Lat,Long) {
    var latlng = new google.maps.LatLng(Lat, Long);
    marker.setPosition(latlng);
}
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBakiaDFinDdeu7GGk0S4dU03dQ7_H9-gA&callback=initMap">
        </script>

    </body>
</html>