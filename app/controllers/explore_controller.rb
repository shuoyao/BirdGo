class ExploreController < ApplicationController
    # def index
        
    #     @search = params[:search] ? params[:search] : {}
    #     #@articles = Bird.search(@search)
    #     @article = Bird.find_by(name: search)
    # end
    
    
    def view
        Bird.delete_all
        Bird.create({:locationX => -25.363, :locationY => 131.044, :name => 'uluru'})
        Bird.create({:locationX => -5.363, :locationY => 131.044, :name => 'uluru2'})
        @birds = Bird.all.as_json
        gon.birds = @birds
   	    render "explore.html"
   	end
end

