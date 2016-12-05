class WishlistController < ApplicationController
    def add
        bird = Bird.find_by_name(params[:name])
        wishlist.add_bird(bird)
        redirect_to "/"
    end
    def see
        bird = Bird.find_by_name(params[:name])
        wishlist.see_bird(bird)
        redirect_to "/"
    end
    def remove
        bird = Bird.find_by_name(params[:name])
        wishlist.remove_bird(bird)
        redirect_to "/"
    end
end
