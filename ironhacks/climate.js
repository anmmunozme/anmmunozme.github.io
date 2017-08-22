var prcpa = [];
var tavga = ["Average temperature"];
var tmaxa = ["Maximum temperature"];
var tmina = ["Minimum temperature"];

function formatdate(date) {
  var porcion = date.substring(0, 10);
  return porcion;
}

//wather info
$(document).ready(function() {
$.ajax({
  url: "https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=GHCND&locationid=ZIP:60605&startdate=2017-04-19&enddate=2017-04-19",
  type: "GET",
  data:{
  },
  headers:{
    token: "jMKtJVDpCMLVKbJnuULkEpjDdWqTeial"
    //token: "edxWNVIMowiRcUIqCKuBIdkCAEmTyvze"
  }
}).done(function(data) {
  //console.log(data);
  document.getElementById("infoweather").innerHTML =  formatdate(data.results[0].date) + "<br> Maximum temperature: <br> " + data.results[0].datatype + " "+ data.results[0].value + "<br> Minimum temperature: <br>" + data.results[1].datatype + " "+ data.results[1].value;
});
});


$(document).ready(function() {
  $.ajax({
    url:"https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=GSOM&stationid=GHCND:USC00111550&stationid=GHCND:US1ILCK0145&units=standard&startdate=2016-08-01&enddate=2017-03-01",
    data:{
      limit: 1000
    },
    headers:{
      token: "jMKtJVDpCMLVKbJnuULkEpjDdWqTeial"
      //token: "edxWNVIMowiRcUIqCKuBIdkCAEmTyvze"
    }
  }).done(function(data) {
    //console.log(data);
    for (var key in data.results) {

      if(data.results[key].datatype == "PRCP"){
        prcpa.push(data.results[key].value);
				//console.log(data.results[key]);
			}
      /*if(data.results[key].datatype == "TAVG"){
        if(data.results[key].date && (typeof (data.results[key].value) == undefined)){
          tavga.push("0");
        }
        else {
          tavga.push(data.results[key].value);
        }
      }*/

      if(data.results[key].datatype == "TAVG"){
        tavga.push(data.results[key].value);
        //console.log(data.results[key]);
			}
      if(data.results[key].datatype == "TMAX"){
        tmaxa.push(data.results[key].value);
        //console.log(data.results[key]);
			}
      if(data.results[key].datatype == "TMIN"){
        tmina.push(data.results[key].value);
        //console.log(data.results[key]);
			}
    }
    //console.log(prcpa, tavga, tmaxa, tmina);

    //Graph
    Dchart = c3.generate({
        bindto: '#Dchart',
        size: {
            width: 450,
            height: 300
        },
        data: {
            x : 'x',
            columns: [
              ['x', '2016-08-01', '2016-09-01', '2016-10-01', '2016-11-01', '2016-12-01', '2017-01-01', '2017-02-01', '2017-03-01'],
                tavga,
                tmaxa,
                tmina
            ],
            colors: {
              "Average temperature": "#23b123",
              "Maximum temperature": '#d91717',
              "Minimum temperature": '#1f70ac'
            },
            axes: {

              "Average temperature": "y",
              "Maximum temperature": 'y',
              "Minimum temperature": 'y'
            }
        },
        zoom: {
          enabled: true
        },
        axis: {
          x: {
           type: 'timeseries',
           tick: {
            rotate: 30,
            format: '%Y-%m-%d'
           }
         },

            y: {
                label: {
                    text: 'Temperature °',
                    position: 'outer-middle'
                }
            },

        },

    });

});
});
