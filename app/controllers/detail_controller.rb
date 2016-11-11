class DetailController < ApplicationController
  
    def display
        @pins = Pin.where(id = params[:id])
        puts @pins == nil
        puts @pins.first == nil
        if @pins.nil? 
            # @birds = Bird.create("wigeon", "1.0", "2.0","test_wiki", "09/09/10", "10")
            @name = "wigeon"
            @locationX = "1.0"
            @locationY = "2.0"
            @wiki_link = "test_wiki"
            @last_seen = "09/09/10"
            @frequency = "10"
            render 'index'
        else 
            @pins = @pins.first
            bird = Bird.where(id = @pins.id).first
            @name = bird.name
            @locationX = @pins.locationX
            @locationY = @pins.locationY
            @wiki_link = bird.wiki_link
            @last_seen = bird.last_seen
            @frequency = bird.frequency
            render 'index'
        end
    end


end


 