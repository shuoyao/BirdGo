var map;

$('#search_result').reset();
      function initMap() {
        var birds = [];
        for (var i = 0; i < gon.birds.length; i++) {
          bird = gon.birds[i];
          birds.push({lat: bird.locationX, lng: bird.locationY});
        }
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: birds[0]
        });
        for (var i = 0; i < birds.length; i++) {
          pin = birds[i];
          var marker = new google.maps.Marker({
            position: pin,
            map: map
          });
        }
      }