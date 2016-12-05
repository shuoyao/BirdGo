class WishlistController < ApplicationController
    def add
        wishlist = Wishlist.find_by_id(params[:id])
        if !current_user.wishlists.include? wishlist
            redirect_to "/"
        end
        bird = Bird.find_by_name(params[:name])
        if bird == nil
            Bird.create({name: params[:name]})
            bird = Bird.find_by_name(params[:name])
        end
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
