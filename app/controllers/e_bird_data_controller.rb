require 'net/http'
require 'json'

class EBirdDataController < ApplicationController
	def NearestBirds()
    	lng = params['lng']
    	lat = params['lat']
    	radius = params['r']
    	back_days = params['t']
    	url = 'http://ebird.org/ws1.1/data/obs/geo/recent?lng=' + lng + '&lat=' + lat + '&dist=' + radius+ '&back=' + back_days + '&fmt=json'
    	uri = URI(url)
		response = Net::HTTP.get(uri)
		render json: response
	end
end


 
