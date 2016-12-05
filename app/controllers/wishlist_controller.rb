class WishlistController < ApplicationController
    def add
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(params[:id])
        wishlist.add_bird(bird)
        redirect_to "/"
    end
    def see
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(params[:id])
        obslist = wishlist.user.observedlist
        wishlist.see_bird(bird)
        obslist.add_bird(bird)
        redirect_to "/"
    end
    def remove
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(params[:id])
        wishlist.remove_bird(bird)
        redirect_to "/"
    end
end
