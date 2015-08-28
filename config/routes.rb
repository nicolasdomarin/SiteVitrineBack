Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
     root :to => "users#info"

     get '/home' => 'users#info'
     get 'login'  => 'sessions#new' 
     post 'login' => 'sessions#create'
     

     delete 'logout' => 'sessions#destroy'
    resources :sessions


    get "/products" => 'products#index'
    get "/products/new" => 'products#new'
    get "/products/show/:id" => 'products#show'
    get "/products/edit/:id" => 'products#edit'
     resources :products
     get "/categories" => 'categories#index'
     get "/categories/new" => 'categories#new'
     get "/categories/show/:id" => 'categories#show'
     get "/categories/edit/:id" => 'categories#edit'
      resources :categories


       get "/sales" => 'sales#index'
     get "/sales/new" => 'sales#new'
     get "/sales/show/:id" => 'sales#show'
     get "/sales/edit/:id" => 'sales#edit'
     resources :sales
      get "/users" => 'users#index'
     get "/users/new" => 'users#new'
     get "/users/show/:id" => 'users#show'
     get "/users/edit/:id" => 'users#edit'
     resources :users
delete '/products/destroy/:id' => 'products#destroy'
 delete '/categories/destroy/:id' => 'categories#destroy'
 delete 'sales/destroy/:id' => 'sales#destroy'

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
