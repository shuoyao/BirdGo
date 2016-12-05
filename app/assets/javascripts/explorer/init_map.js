$('#search_result').html("");
function initMap() {
  if (document.geoReady == undefined) {
    return;
  }
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lng: document.lng, lat: document.lat}
  });
  map.markerArray = [];
  document.map = map;
  google.maps.Map.prototype.clearOverlays = function() {
    for (var i = 0; i < map.markerArray.length; i++ ) {
      map.markerArray[i].setMap(null);
    }
    map.markerArray.length = 0;
  }
  lng = document.lng
  lat = document.lat
  radius = 10
  time = 30
  url = "/eBirdData/NearestBirds?lng=" + lng + "&lat=" + lat + "&r=" + radius + "&t=" + time
  fetchDataAtLocationAndShow(url)
  
  map.addListener('dragend', function(e) {
    center = map.getCenter()
    lng = center.lng()
    lat = center.lat()
    radius = 10
    time = 30
    url = "/eBirdData/NearestBirds?lng=" + lng + "&lat=" + lat + "&r=" + radius + "&t=" + time
    fetchDataAtLocationAndShow(url)
    }
  );
  document.extra_data = 0
}

function fetchDataAtLocationAndShow(url) {
  $.ajax({
    url: url,
    method: "GET",
    // "BirdGo.com/eBirdData/NearesrBIrds/lng=xxx&lat=xxx&r=xxx&t=xxx"
    dataType: "json",
    success: markTheseData,
    error: function() {
      alert("Search Failed. Please Try again.")
    }
  })
}

function fetchDataAtLocationAndShowWithoutClearingBefore(url) {
  $.ajax({
    url: url,
    method: "GET",
    // "BirdGo.com/eBirdData/NearesrBIrds/lng=xxx&lat=xxx&r=xxx&t=xxx"
    dataType: "json",
    success: markTheseDataWithoutClearingBefore,
    error: function() {
      alert("Search Failed. Please Try again.")
    }
  })
}

function markTheseData(data) {
  map = document.map
  map.clearOverlays();

  for (var i = 0; i < data.length; i++) {
    var abird = data[i];
      var marker = new google.maps.Marker({
        position: {lat: parseFloat(abird.lat), lng: parseFloat(abird.lng)},
        map: map
      });
      map.markerArray.push(marker);
      
      contentString = '<div id="content">'+
       '<div id="siteNotice">'+
       '</div>' + '<div id="bodyContent">'+
       '<p><b>'
        + abird['sciName']
       + '</b></p><p>'
      + "Last Seen: " + abird['obsDt'] + '</p><p>'
       + '</p>'+
       '<p>Link: <a href=' + 'http://en.wikipedia.org/wiki/' + abird['sciName'].replace(" ", "%20") + '>'
       + 'wikipedia' + '</a>'+
       '</p>'+ '<button type="button"  onclick="location.href=\'/wishlist/1/add?name=' + abird['sciName'] + '\';">Add to Wishlist</button>' +
       '<button type="button"  onclick="location.href=\'/observed/see?name=' + abird['sciName'] + '\';">Yes, I see it</button>' +
      '</div>' +
      '</div>'; 

    marker.contentString = contentString;
    
    var infowindow = new google.maps.InfoWindow({
      content: ''
    });

    marker.addListener('click', function() {
      infowindow.setContent(this.contentString);
      infowindow.open(map, this);
    });
  }
  
  if (document.extra_data != 0) {
    for (var i = 0; i < document.extra_data.length; i++) {
      var abird = document.extra_data[i];
        var marker = new google.maps.Marker({
          position: {lat: parseFloat(abird.lat), lng: parseFloat(abird.lng)},
          map: map,
          icon: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
        });
        map.markerArray.push(marker);
        
        contentString = '<div id="content">'+
         '<div id="siteNotice">'+
         '</div>' + '<div id="bodyContent">'+
         '<p><b>'
          + abird['sciName']
         + '</b></p><p>'
        + "Last Seen: " + abird['obsDt'] + '</p><p>'
         + '</p>'+
         '<p>Link: <a href=' + 'http://en.wikipedia.org/wiki/' + abird['sciName'].replace(" ", "%20") + '>'
         + 'wikipedia' + '</a>'+
         '</p>'+ '<button type="button"  onclick="location.href=\'/wishlist/1/add?name=' + abird['sciName'] + '\';">Add to Wishlist</button>' +
         '<button type="button"  onclick="location.href=\'/observed/see?name=' + abird['sciName'] + '\';">Yes, I see it</button>' +
        '</div>' +
        '</div>';  
  
      marker.contentString = contentString;
      
      var infowindow = new google.maps.InfoWindow({
        content: ''
      });
  
      marker.addListener('click', function() {
        infowindow.setContent(this.contentString);
        infowindow.open(map, this);
      });
    }
  }
}

function markTheseDataWithoutClearingBefore(data) {
  map = document.map
  console.log(data)

  for (var i = 0; i < data.length; i++) {
    var abird = data[i];
      var marker = new google.maps.Marker({
        position: {lat: parseFloat(abird.lat), lng: parseFloat(abird.lng)},
        map: map,
        icon: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
      });
      map.markerArray.push(marker);
      
      contentString = '<div id="content">'+
       '<div id="siteNotice">'+
       '</div>' + '<div id="bodyContent">'+
       '<p><b>'
        + abird['sciName']
       + '</b></p><p>'
      + "Last Seen: " + abird['obsDt'] + '</p><p>'
       + '</p>'+
       '<p>Link: <a href=' + 'http://en.wikipedia.org/wiki/' + abird['sciName'].replace(" ", "%20") + '>'
       + 'wikipedia' + '</a>'+
       '</p>'+ '<button type="button"  onclick="location.href=\'/wishlist/1/add?name=' + abird['sciName'] + '\';">Add to Wishlist</button>' +
       '<button type="button"  onclick="location.href=\'/observed/see?name=' + abird['sciName'] + '\';">Yes, I see it</button>' +
      '</div>' +
      '</div>';  

    marker.contentString = contentString;
    
    var infowindow = new google.maps.InfoWindow({
      content: ''
    });

    marker.addListener('click', function() {
      infowindow.setContent(this.contentString);
      infowindow.open(map, this);
    });
  }
  
  document.extra_data = data
}