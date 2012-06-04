Websitewmo::Application.routes.draw do

  get "sessions/new"

  match 'contact/form' => 'contact#new', :as => 'contact', :via => :get
  match 'contact/form' => 'contact#create', :as => 'contact', :via => :post
  match 'meldpunt' => 'mention#new', :as => 'meldpunt', :via => :get
  match 'meldpunt' => 'mention#create', :as => 'meldpunt', :via => :post

  resources :posts
  resources :pages
  resources :categories
  resources :contact
  resources :administrators
  resources :sessions, only: [:new, :create, :destroy]


  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'

  #Home pages
  root :to => 'pages#home' , category_id: [1,2,3]
  

  #De actual pages
  get "wmo" => "pages#actual", as: 'wmo', category_id: 1
  get "wgt" => "pages#actual", as: 'wgt', category_id: 2
  get "algemeen" => "pages#actual", as: 'algemeen', category_id: 3
  get "nieuwsoverzicht" => "pages#actual_news", as: 'nieuwsoverzicht', category_id: [1,2,3]
  
  #De info pages
  get "prestatievelden" => "pages#info", as: 'prestatievelden'
  get "afkortingen" => "pages#info_shorts", as: 'afkortingen', category_id: 4
  get "tips" => "pages#info", as: "tips", category_id: 5

  #De contact pages
  get "faq" => "pages#contact", as: 'faq', category_id: 6
  get "links" => "pages#contact", as: 'links', category_id: 7
  get "adressen" => "pages#contact_adressen", as: "adressen"
  

  match '/about',     to: 'pages#about'
  match '/informatie',to: 'pages#info'
  match '/actual',    to: 'pages#actual'
  #match '/contact',   to: 'pages#contact'
  match '/meldpunt',  to: 'pages#hotline'
  match '/over_wgt', to: 'pages#about_wgt'

  match '/nieuweposts',  to: 'posts#new'

  #Indeling category_id
  #1:   WMO Adviesraad
  #2:   Werkgroep Toegankelijkheid
  #3:   Algemeen
  #4:   Afkortingen
  #5:   Tips
  #6:   Veel gestelde vragen
  #7:   Handige links



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
   #root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
