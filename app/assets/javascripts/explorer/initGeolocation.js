function initGeolocation()
{
   if( navigator.geolocation )
   {
      // Call getCurrentPosition with success and failure callbacks
      navigator.geolocation.getCurrentPosition( success, fail );
   }
   else
   {
      alert("Sorry, your browser does not support geolocation services.");
   }
}

function success(position)
{
    document.lng = position.coords.longitude;
    document.lat = position.coords.latitude;
    document.geoReady = true;
    initMap();
}

function fail()
{
   // Could not obtain location
   alert('Unable to determine where u r lol, plz tell us if you want to know the birds around you')
}