class ExploreController < ApplicationController
    
    def search
        @search = params[:search] ? params[:search] : {}
        flash[:search_result] = Bird.where(name: @search)
        redirect_to explore_path
    end
    
    
    def view
        Bird.delete_all
        Bird.create({:locationX => -25.363, :locationY => 131.044, :name => 'bird1'})
        Bird.create({:locationX => -5.363, :locationY => 131.044, :name => 'bird2'})
        if flash[:search_result] != nil
            @birds = flash[:search_result].as_json
        else
            @birds = Bird.all.as_json
        end
        if !(@birds.is_a? Array)
            @birds = [@birds]
        end
        gon.birds = @birds
   	    render "explore.html"
   	end
end

