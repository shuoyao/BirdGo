function Ebird_url_generator() {}

Ebird_url_generator.prototype.RecentNearbyObservations = function (lat, lng, radius, back_history) {
	return 'http://ebird.org/ws1.1/data/obs/geo/recent?lng=' + lng + '&lat=' + lat + '&dist=' + radius+ '&back=' + back_history + '&fmt=json';
};

function Ebird_data_processor() {}

Ebird_data_processor.prototype.RecentNearbyObservations = function(jsonResult) {
	// This one returns lat, lng, how many and commnon name and time of last seen
	var sightings = JSON.parse(jsonResult);
	return sightings
}
