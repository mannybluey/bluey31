Bluey::Application.routes.draw do
  get "pages/landing"
  get "pages/dashboard"
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  # Users and their profile management
  match "profile/edit", :to => "user_profiles#edit", :via => "get"
  match "profile", :to => "user_profiles#update", :via => "put"
  match "profile/quickedit", :to => "user_profiles#update_attribute_on_the_spot", :via => "put"
  resources :user_goals, :only => :index
  match "user_goals", :to => "user_goals#update", :via => "put"
  resources :user_images, :only => [:index, :create, :destroy] do
    member do
      get :update_profile_picture
    end
  end
  devise_for :users

  # Plans
  resources :plans, :except => [:edit] do
    collection do
      put :update_attribute_on_the_spot
    end
    resources :days, :only => [:create, :destroy] do
      resources :plan_items
    end
  end

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
  # root :to => "welcome#index"
  root :to => 'pages#landing'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
