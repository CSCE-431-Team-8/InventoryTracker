Rails.application.routes.draw do

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')

  put 'increase_quantity/:id/:quantity', to: 'items#increase_quantity'
  put 'decrease_quantity/:id/:quantity', to: 'items#decrease_quantity'
  get 'items/rent_item/:id', to: 'items#rent_item', as: :rent_item_path
  get 'organizations/:id/items', to: 'organizations#items', as: :org_items_path
  get 'organizations/:id/members', to: 'organizations#members', as: :org_members_path
  get 'return_item/:id', to: 'rented_items#return_item', as: :return_item_path
  get 'join_org/:id', to: 'organizations#join_org', as: :join_org_path
  put 'membership/:id/destroy', to: 'memberships#destroy'
  
  delete '/sessions', to: 'sessions#destroy'

  resources :items
  resources :logins
  resources :rented_items
  resources :organizations
  resources :memberships
  resources :users
  resources :sessions, only: [:create]

  root 'homes#home'

  
  
  # post 'login' => 'login#login',:as => 'login'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
