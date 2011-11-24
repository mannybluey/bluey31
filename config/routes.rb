Bluey::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  #devise_for :users
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations", :passwords => "passwords" } do
    post 'continue' => 'sessions#continue', :as => :continue
  end

  get "pages/landing"
  #get "pages/dashboard"
  match "pages/dashboard", :to => "plans#index", :as => "dashboard", :via => 'get'
 # get "plan/:id", :to => "plans#new"
  get "plan_type/:id", :to => "plans#index", :as => "plan_type"
  
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  # Users and their profile management
  match "profile/remove", :to => "user_profiles#remove", :via => "get", :as => "profile_remove"
  match "profile/edit", :to => "user_profiles#edit", :via => "get", :as => "profile_edit"
  match "profile/delete", :to => "user_profiles#destroy", :via => "delete", :as => "profiles"
  match "profile", :to => "user_profiles#update", :via => "put", :as => "profile"
  match "profile/quickedit", :to => "user_profiles#update_attribute_on_the_spot", :via => "put"

  match "pages/not_yet_implemented", :to => "pages#not_yet_implemented", :via => "get", :as => "not_yet_implemented"
  
  resources :user_goals, :only => :index
  match "user_goals", :to => "user_goals#update", :via => "put"  
  resources :plan_item_images, :only => [:new, :create, :destroy] 

  resources :user_images, :only => [:index, :create, :destroy] do
    member do
      get :update_profile_picture
    end
  end
  
  
  # Plans
  #resources :plans, :except => [:edit] do
  resources :plans do
    collection do
      get :exercises
      get :nutritions
      put :update_attribute_on_the_spot
    end
    resources :days, :only => [:create, :destroy] do
      get :toggle_completed_items
      resources :plan_items
      resources :meals
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
