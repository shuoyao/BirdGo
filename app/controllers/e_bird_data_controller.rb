require 'net/http'
require 'json'

class EBirdDataController < ApplicationController
	def NearestBirds()
		# https://confluence.cornell.edu/display/CLOISAPI/eBird-1.1-RecentNearbyObservations
    	lng = params['lng']
    	lat = params['lat']
    	radius = params['r']
    	back_days = params['t']
    	url = 'http://ebird.org/ws1.1/data/obs/geo/recent?lng=' + lng + '&lat=' + lat + '&dist=' + radius+ '&back=' + back_days + '&fmt=json'
    	uri = URI(url)
		response = Net::HTTP.get(uri)
		render json: response
	end
	
	def NearestLocationsWithObservationsOfASpecies()
		# https://confluence.cornell.edu/display/CLOISAPI/eBird-1.1-NearestLocationsWithObservationsOfASpecies
		lng = params['lng']
    	lat = params['lat']
    	back_days = params['t']
    	sci = params['sci']
    	url = 'http://ebird.org/ws1.1/data/nearest/geo_spp/recent?lng=' + lng + '&lat=' + lat + '&back=' + back_days + '&fmt=json' + '&sci=' + sci
    	uri = URI(url)
		response = Net::HTTP.get(uri)
		render json: response
	end
	
	def RecentNearbyObservationsOfASpecies()
		# https://confluence.cornell.edu/display/CLOISAPI/eBird-1.1-RecentNearbyNotableObservations
		lng = params['lng']
    	lat = params['lat']
    	radius = params['r']
    	back_days = params['t']
    	sci = params['sci']
    	url = 'http://ebird.org/ws1.1/data/obs/geo_spp/recent?lng=' + lng + '&lat=' + lat + '&dist=' + radius+ '&back=' + back_days + '&fmt=json' + '&sci=' + sci
    	uri = URI(url)
		response = Net::HTTP.get(uri)
		render json: response
	end
end


 
