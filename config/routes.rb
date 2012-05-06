Movienights::Application.routes.draw do
  
  resources :users

  resources :events do
    get 'rank', :on => :member
    post 'send_rank', :on => :member
    get 'suggestions', :on => :member
    post 'send_suggestions', :on => :member
  end

  match 'events/:id/send_ranks' => "events#send_ranks", :as => :send_ranks
  match 'events/:id/send_suggestions' => "events#send_suggestions", :as => :send_suggestions
  
  resources :movies

  #setting up an example!
  match 'home' => 'application#home'

  match '/sessions/create' => "sessions#create", :via => :post
  match '/login' => "sessions#new"
  match '/logout' => "sessions#destroy"

  #get 'rank', :on => :member
  #post 'send_ranks', :on => :member

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
