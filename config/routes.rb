
Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update, :show]
  end
  # resources :users, controller: "users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get 'welcome/index'
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/users/:id" => "users#show"
  #added
  # get "/users_path" => "clearance/users#show"
  # get "/users" => "clearance/users#show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
end

# Prefix Verb   URI Pattern                             Controller#Action
#     welcome_index GET    /welcome/index(.:format)                welcome#index
#               root GET    /                                       welcome#index
#         passwords POST   /passwords(.:format)                    clearance/passwords#create
#       new_password GET    /passwords/new(.:format)                clearance/passwords#new
#           session POST   /session(.:format)                      clearance/sessions#create
#     user_password POST   /users/:user_id/password(.:format)      clearance/passwords#create
# edit_user_password GET    /users/:user_id/password/edit(.:format) clearance/passwords#edit
#                   PATCH  /users/:user_id/password(.:format)      clearance/passwords#update
#                   PUT    /users/:user_id/password(.:format)      clearance/passwords#update
#             users POST   /users(.:format)                        clearance/users#create
#           sign_in GET    /sign_in(.:format)                      clearance/sessions#new
#           sign_out DELETE /sign_out(.:format)                     clearance/sessions#destroy
#           sign_up GET    /sign_up(.:format)                      clearance/users#new
