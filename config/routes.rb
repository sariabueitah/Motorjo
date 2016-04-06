Rails.application.routes.draw do
  namespace :admin do
    resources :main_sliders
  end

  get 'set_language/english'

  get 'set_language/arabic'

  get 'homepage/index'
  root to: "homepage#index"
  devise_for :users, :skip => [:registrations]
  resources :cars do
    collection do
      get 'admin_car'
      patch 'admin_car_update'
      post "contact_submit" => "cars#contact_submit"
      delete "delete_image/:id" => "cars#delete_image"
    end
  end
  resources :members do
    collection do
      get 'admin_member'
      patch 'admin_member_update'
      patch  'member/edit/password/' => 'members#update_password'
      put  'member/edit/password/' => 'members#update_password'
    end
  end
  resources :dealers do
    collection do
      get 'admin_dealer'
      patch 'admin_dealer_update'
      patch  'dealer/edit/password/' => 'dealers#update_password'
      put  'dealer/edit/password/' => 'dealers#update_password'
    end
  end
  resources :makes, except: :show
  resources :models, except: :show
  resources :comfort_interiors, except: :show
  resources :interior_designs, except: :show
  resources :colors, except: :show
  resources :interior_colors, except: :show
  resources :safety_features, except: :show
  get 'admin', to: 'admin#index'

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
