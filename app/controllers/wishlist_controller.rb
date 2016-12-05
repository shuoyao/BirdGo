class WishlistController < ApplicationController
    def add
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(1)
        wishlist.add_bird(bird)
        redirect_to "/"
    end

    def remove
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(1)
        wishlist.remove_bird(bird)
        redirect_to "/"
    end
end
