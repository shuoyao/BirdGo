class DetailController < ApplicationController
  
    def display
        @birds = Bird.where(id = params[:id])
        puts @birds == nil
        puts @birds.first == nil
        if @birds.nil? 
            # @birds = Bird.create("wigeon", "1.0", "2.0","test_wiki", "09/09/10", "10")
            @name = "wigeon"
            @locationX = "1.0"
            @locationY = "2.0"
            @wiki_link = "test_wiki"
            @last_seen = "09/09/10"
            @frequency = "10"
            render 'index'
        else 
            @birds = @birds.first
            @name = @birds.name
            @locationX = @birds.locationX
            @locationY = @birds.locationY
            @wiki_link = @birds.wiki_link
            @last_seen = @birds.last_seen
            @frequency = @birds.frequency
            render 'index'
        end
    end


end


 