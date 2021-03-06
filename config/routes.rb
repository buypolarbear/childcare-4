Childcare::Application.routes.draw do

  resources :events

  match '/settings',	to: 'facilities#edit',	via: 'get'
  get "facilities/timespace"
  get "reports/test_action"
  
  resources :facilities, except: [:destroy, :index]
  
  # static pages
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/home',	to: 'static_pages#home',	via: 'get'
  
  
  resources :incomes do
	member do
		get 'toggle_paid'
	end
  end 
  
  match '/expenses/year_end_report',	to: 'expenses#year_end_report',	via: 'get'
  match '/signin/admin_session_type',	to: 'sessions#admin_session_type',	via: 'get'
  
  resources :expenses
  resources :invoices
  
  resources :vehicles
  resources :documents do
	member do
      get :download
    end
  end
  resources :users do
	get :autocomplete_user_lname, :on => :collection
	member do
		get 'create_work_event'
	end
  end
  resources :parents do
	get :autocomplete_parent_lname, :on => :collection
  end
  resources :rates do
	get :autocomplete_rate_name, :on => :collection
  end
  
  resources :children
  resources :sessions, only: [:new, :create, :destroy]
  #root  'sessions#new'
  root	'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  


  #match '/signin/create_work_event',    to: 'users#create_work_event',    via: 'get'
  
  match '/child_signin',    to: 'child_arrive_depart#last_names',    via: 'get'
  match '/child_signin/children',    to: 'child_arrive_depart#children',    via: 'get'
  match '/child_signin/toggle_signin',    to: 'child_arrive_depart#toggle_signin',    via: 'get'
  
  

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
