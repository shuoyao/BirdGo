class WishlistController < ApplicationController
    def add
        wishlist = Wishlist.find_by_id(params[:id])
        if !current_user.wishlists.include? wishlist
            redirect_to "/"
            break
        end
        bird = Bird.find_by_name(params[:name])
        wishlist = Wishlist.find_by_id(params[:id])
        wishlist.add_bird(bird)
        redirect_to "/"
    end

    def remove
        wishlist = Wishlist.find_by_id(params[:id])
        if !current_user.wishlists.include? wishlist
            redirect_to "/"
            break
        end
        bird = Bird.find_by_name(params[:name])=
        wishlist.remove_bird(bird)
        redirect_to "/"
    end
end
