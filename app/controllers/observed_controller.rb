class ObservedController < ApplicationController
    def see
        bird = Bird.find_by_name(params[:name])
        if bird == nil
            Bird.create({name: params[:name]})
            bird = Bird.find_by_name(params[:name])
        end
        wishlists = current_user.wishlists
        for wishlist in wishlists
            wishlist.see_bird(bird)
        end
        obslist = current_user.observedlist
        obslist.add_bird(bird)
        redirect_to "/"
    end
end
