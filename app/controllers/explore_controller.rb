class ExploreController < ApplicationController
    def index
        
        @search = params[:search] ? params[:search] : {}
        #@articles = Bird.search(@search)
        @article = Bird.find_by(name: search)
    end
end
