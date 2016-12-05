class ExploreController < ApplicationController
    def view
        search = params[:search] != "" ? params[:search] : nil
        if search != nil
            bird = Bird.where('name LIKE ?', "%#{search}%").first
            search_result = bird ? Pin.where(bird_id: bird.id) : nil
            if search_result != nil
                flash[:alert] = ""
                @birds = search_result.as_json
            else
                flash[:alert] = "No matching bird found!"
                @birds = Pin.all.as_json
            end
        else
            flash[:alert] = ""
            @birds = Pin.all.as_json
        end
        if !(@birds.is_a? Array)
            @birds = [@birds]
        end
        gon.pins = @birds
        gon.birds = Bird.all.as_json
        @wishlists = []
        current_user.wishlist_ids.each do |id|
            @wishlists.push(Wishlist.find_by_id(id))
        end
   	    render "explore.html"
   	end
   	
   	def logout
   	    sign_out current_user
   	    redirect_to "/users/sign_in" 
   	end
end

