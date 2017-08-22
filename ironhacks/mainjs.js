var rentM = [];
var markers = [];
var policeM = [];
var parkM = [];
var fireM = [];
var hospitalM = [];
var crimeM = [];

  function rent(map){
$.ajax({
    url: "https://data.cityofchicago.org/resource/uahe-iimk.json",
    type: "GET",
    data: {
      "$where" : "latitude IS NOT NULL" ,
      "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
    }
}).done(function(data) {
  //document.getElementById("inforentall").innerHTML =  "(" + data.length + ") Rent places";
    for (var i = 0; i <= data.length; i++) {
      place = new google.maps.LatLng(data[i].latitude,data[i].longitude);
		  var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(data[i].latitude,data[i].longitude),
	      map: map,
	      title: data[i].address,
	      icon: "images/icon2.png",
        distance: distan(place)
	   	});
      rentM.push(marker);
      markers.push(marker);
    };
});
}


function rentHid() {
  for (var i = 0; i < rentM.length; i++) {
    rentM[i].setMap(null);
  }
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
  }
}

function bic(map) {
  map.data.loadGeoJson('https://data.cityofchicago.org/api/geospatial/kdt9-s6vu?method=export&format=GeoJSON');
}
function bicf(map) {
  map.data.setMap(null);
}
//Police stations

function police(map){
$.ajax({
  url: "https://data.cityofchicago.org/resource/9rg7-mz9y.json",
  type: "GET",
  data: {
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
document.getElementById("infopolall").innerHTML =  "(" + data.length + ") Police stations";
for (var i = 0; i<=data.length; i++) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(data[i].latitude,data[i].longitude),
	      map: map,
	      title: data[i].address,
	      icon: "images/iconpol.png"
    });
    policeM.push(marker);
    markers.push(marker);
  };
});
}

function policeHandler(){
  if(police_check.checked){
    police(map);
   }
   else{
     for (var i = 0; i < policeM.length; i++) {
             policeM[i].setMap(null);
     }
   }
}


//Parks
function park(map){
$.ajax({
  url: "https://data.cityofchicago.org/resource/cz2z-xiax.json",
  type: "GET",
  data: {
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
document.getElementById("infoparkall").innerHTML =  "(" + data.length + ") Parks";
for (var i = 0; i<=data.length; i++) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(data[i].location.coordinates[1],data[i].location.coordinates[0]),
	      map: map,
	      title: data[i].address,
	      icon: "images/iconpa.png"
    });
    parkM.push(marker);
    markers.push(marker);
  };
});
}

function parkHandler(){
  if(park_check.checked){
    park(map);
   }
   else{
     for (var i = 0; i < parkM.length; i++) {
             parkM[i].setMap(null);
     }
   }
}


//Fire Stations
function fire(map){
$.ajax({
  //url: "https://data.cityofchicago.org/api/views/hp65-bcxv",
  url: "https://data.cityofchicago.org/resource/b4bk-rjxe.json",
  type: "GET",
  data: {
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
document.getElementById("infofireall").innerHTML =  "(" + data.length + ") Fire Stations";
for (var i = 0; i<=data.length; i++) {
    var marker = new google.maps.Marker({
      //position: new google.maps.LatLng(data[i].columns[6].cachedContents.largest.latitude,data[i].columns[6].cachedContents.largest.longitude),
	  position: new google.maps.LatLng(data[i].location.coordinates[1],data[i].location.coordinates[0]),
		  map: map,
	      title: data[i].address,
	      icon: "images/iconfire.png"
    });
    fireM.push(marker);
    markers.push(marker);
  };
});
}

function fireHandler(){
  if(fire_check.checked){
    fire(map);
   }
   else{
     for (var i = 0; i < fireM.length; i++) {
             fireM[i].setMap(null);
     }
   }
}

//Hospitals
function hospital(map){
$.ajax({
  url: "https://data.cityofchicago.org/resource/23z4-s99a.json",
  type: "GET",
  data: {
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
document.getElementById("infohospall").innerHTML =  "(" + data.length + ") Hospitals";
for (var i = 0; i<=data.length; i++) {
    var marker = new google.maps.Marker({
	  position: new google.maps.LatLng(data[i].location.coordinates[1],data[i].location.coordinates[0]),
		  map: map,
	      title: data[i].address,
	      icon: "images/iconho.png"
    });
    hospitalM.push(marker);
    markers.push(marker);
  };
});
}

function hospitalHandler(){
  if(hospital_check.checked){
    hospital(map);
   }
   else{
     for (var i = 0; i < hospitalM.length; i++) {
             hospitalM[i].setMap(null);
     }
   }
}

//Crimes
function crime(map){
$.ajax({
  url: "https://data.cityofchicago.org/resource/crimes.json",
  type: "GET",
  data: {
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
document.getElementById("infocrimeall").innerHTML =  "(" + data.length + ") Crimes reported";
for (var i = 0; i<=data.length; i++) {
    var marker = new google.maps.Marker({
	  position: new google.maps.LatLng(data[i].location.latitude,data[i].location.longitude),
		  map: map,
	      title: data[i].address,
	      icon: "images/iconcr.png"
    });
    crimeM.push(marker);
    markers.push(marker);
  };
});
}

function crimeHandler(){
  if(crime_check.checked){
    crime(map);
   }
   else{
     for (var i = 0; i < crimeM.length; i++) {
             crimeM[i].setMap(null);
     }
   }
}

function distan(place){
	return Math.round(google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(41.8708, -87.6505),place));
}

//new token edxWNVIMowiRcUIqCKuBIdkCAEmTyvze
/*
function rentfilter(map){
  var rentl = [];
  var rentlm = [];
  var rente =[];
$.ajax({
  url: "https://data.cityofchicago.org/resource/uahe-iimk.json",
  type: "GET",
  data: {
    "$where" : "latitude IS NOT NULL" ,
    "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
  }
}).done(function(data) {
  for (var i = 0; i <= data.length; i++) {
    place = new google.maps.LatLng(data[i].latitude,data[i].longitude);
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(data[i].latitude,data[i].longitude),
      //map: map,
      title: data[i].address,
      distance: distan(place)
    });

    markers.push(marker);
    if(marker.distance <= 7000){
      rentl.push(marker);
    } else if(marker.distance > 7000 && marker.distance <= 14000){
      rentlm.push(marker);
    }else if(marker.distance > 14000){
      rente.push(marker);
    }
  };


});
console.log(rentlm);
}
*/
