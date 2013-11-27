Ctb::Application.routes.draw do
  resources :pay_types

  resources :orders

  resources :categories

  resources :statuses
  resources :conditions
  resources :locations
  resources :products  do
    get :who_bought, :on => :member
  end

  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end

  resources :carts

  get "store/index"
  get "cart/index" => "cart#index"


  # root :to => "home#index"

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  get "signed_out" => "authentication#signed_out"
  get "forgot_password" => "authentication#forgot_password"
  get "password_sent" => "authentication#password_sent"

  get "sign_in" => "authentication#sign_in"
  post "sign_in" => "authentication#login"

  get "new_user" => "authentication#new_user"
  post "new_user" => "authentication#register"
  put "new_user" => "authentication#register"

  get "account_settings" => "authentication#account_settings"
  put "account_settings" => "authentication#set_account_info"


  get "role_settings" => "authentication#role_settings"
  put "role_settings" => "authentication#set_role_info"


  get "forgot_password" => "authentication#forgot_password"
  put "forgot_password" => "authentication#send_password_reset_instructions"
  get "password_reset" => "authentication#password_reset"
  put "password_reset" => "authentication#new_password"

  get "admin_users" => "admin#users"
  delete "user/:id" => "admin#delete_user", :as => "user"

  get "new_role" => "authentication#new_role"
  put "new_role" => "authentication#create_role"


  get "admin_roles" => "admin#roles"
  delete "role/:id" => "admin#delete_role", :as => "role"

# role assign stuff
  # get "roles" => "roles#index", :as => "root_roles"
  # get "role/assign" => "roles#assign", :to => "role/assign"

 # post "role/assign" => "roles#form", :as => "role/form"
 # get "role/update" => "roles#update", :as => "role/update"

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
