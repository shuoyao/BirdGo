$('#search_result').html("");
function initMap() {
  var birds = [];
  for (var i = 0; i < gon.pins.length; i++) {
    bird = gon.pins[i];
    birds.push({lat: bird.locationX, lng: bird.locationY});
  }
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: birds[0]
  });
  for (var i = 0; i < birds.length; i++) {
    pin = gon.pins[i];
    var pin1 = birds[i];
    bird = null;
    for (var j = 0; j < gon.birds.length; j++) {
      if (gon.birds[j].id == pin.bird_id) {
        bird = gon.birds[j];
      }
    }
    contentString = '<div id="content">'+
       '<div id="siteNotice">'+
       '</div>' + '<div id="bodyContent">'+
       '<p><b>'
        + bird.name
       + '</b></p><p>'
      + "Last Seen: " + bird.last_seen + '</p><p>'
      + "Total Seen: " + bird.frequency
       + '</p>'+
       '<p>Link: <a href=' + bird.wiki_link + '>'
       + bird.wiki_link + '</a>'+
       '</p>'+ '<button type="button"  onclick="location.href=\'/wishlist/1/add?name=' + bird.name + '\';">Click Me!</button>' +
      '</div>' +
      '</div>';

    var infowindow = new google.maps.InfoWindow({
      content: 'bullshit'
    });
    var marker = new google.maps.Marker({
      position: pin1,
      map: map
    });
    
    marker.contentString = contentString;

    marker.addListener('click', function() {
      infowindow.setContent(this.contentString);
      infowindow.open(map, this);
    });
  }
}