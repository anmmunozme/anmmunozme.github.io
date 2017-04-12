var rentM = [];
var markers = [];


  function rent(map){
$.ajax({
    url: "https://data.cityofchicago.org/resource/uahe-iimk.json",
    type: "GET",
    data: {
      "$$app_token" : "HUjUGsr4YSMjvcwZejaYLHoBl"
    }
}).done(function(data) {
  document.getElementById("inforentall").innerHTML =  "All (" + data.length + ") rent places";
    for (var i = 0; i <= data.length; i++) {

		  var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(data[i].latitude,data[i].longitude),
	      map: map,
	      title: data[i].address,
	      icon: "images/icon2.png"
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
