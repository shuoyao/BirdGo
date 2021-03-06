Rails.application.routes.draw do

  # Example of regular route:
  get 'detail/:id' => 'detail#display'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  get '/explore' => 'explore#view'
  post '/explore/search' => 'explore#search'
  get '/explore/logout' => 'explore#logout'
  get '/wishlist/:id/add' => 'wishlist#add'
  get '/wishlist/:id/remove' => 'wishlist#remove'
  get '/observed/see' => 'observed#see'
  get '/intro' => 'intro#show'

  get '/main', to: 'mainpage#show', as: 'mainpage'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root :to => redirect('/main')
  
  # Ninja way to do static routing, reference: http://jerodsanto.net/2013/01/dynamic-routes-to-static-pages-on-rails/
  EBirdDataController.action_methods.each do |action|
    get "/eBirdData/#{action}/", to: "e_bird_data##{action}", as: "eBirdData_#{action}"
  end
end
