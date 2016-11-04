class ExploreController < ApplicationController
    
    def search
        @search = params[:search] ? params[:search] : {}
        bird = Bird.find_by_name(@search)
        flash[:search_result] = Pin.where(bird_id: bird.id)
        redirect_to explore_path
    end
    
    
    def view
        if flash[:search_result] != nil
            @birds = flash[:search_result].as_json
        else
            @birds = Pin.all.as_json
        end
        if !(@birds.is_a? Array)
            @birds = [@birds]
        end
        gon.birds = @birds
        @wishlists = []
        current_user.wishlist_ids.each do |id|
            @wishlists.push(Wishlist.find_by_id(id))
        end
   	    render "explore.html"
   	end
end

