class DetailController < ApplicationController
  
    def display
        @birds = Bird.where(id = params[:id]).first
        @locationX = @birds.locationX
        @locationY = @birds.locationY
        @wiki_link = @birds.wiki_link
        @last_seen = @birds.last_seen
        @frequency = @birds.frequency
    end


end


 