Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [:show, :index] do
    collection do
      get 'inbox' => "users#inbox"
      get 'message/:id' => "users#view_message"
      get 'dwelling_applications'
      put 'dwelling_applications/:id/approve' => "users#approve_application"
      put 'dwelling_applications/:id/reject' => "users#reject_application"
      get 'favorite_dwellings'
    end
  end


# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#                          DELETE /users(.:format)               devise/registrations#destroy


  # edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
  #                        PATCH  /users(.:format)               devise/registrations#update
  #                        PUT    /users(.:format)               devise/registrations#update



# match 'users/sign_out' => "devise/sessions#destroy"

  resources :dwellings, only: [:show, :create, :index] do
    member do
      post 'send_inquiry'
      post 'submit_application'
      put  'favorite'
      put  'unfavorite'
    end
  end

  # root 'dwellings#index'
  root 'home#index'

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
