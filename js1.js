$(document).ready(function(){
  $("#id_btnt").click(function(){
    $.ajax({
      type:"GET",
      url:"http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=47906",
      dataType:"jsonp",
      jsonpCallback:"resultHandler",
      headers:{
        token: "edxWNVIMowiRcUIqCKuBIdkCAEmTyvze",
        limit: 20
      }
    });
  });
});

function resultHandler(result){
  console.log(result.results);
  var mytable = $("<table></table>");
  mytable.append("<tr><td>x</td><th>y</th></tr>");
  for(var i = 0; i < result.results.length; ++i ){
    mytable.append("<tr><td>" + result.results[i].locationid + "</td><td>" + result.results[i].coordinate + "</td></tr>");
  }
  $("body").append(mytable);
}
