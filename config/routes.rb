Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users

  # Root directed to Home page
  root to: 'pages#home'

  # Static pages : landing, how-it-works, about etc.
  get "about" => 'pages#about_us'
  get "how-it-works" => 'pages#how_it_works'

  # Property form funnel routes
  resources :property_forms, only: [:show, :new, :create, :update, :destroy] do
    get "address" => 'property_forms#a_address_validation'
    get "property_type" => 'property_forms#b_property_type_selection'
    put "description_1" => 'property_forms#c_description_1'
    get "description_2" => 'property_forms#d_description_2'
    get "description_3" => 'property_forms#e_description_3'
    get "photos" => 'property_forms#f_add_images'
    get "personnal_information" => 'property_forms#g_personnal_information'
    get "confirmation" => 'property_forms#h_confirmation'
    get "validation" => 'property_forms#i_validation'
  end

  # Property image routes to create or delete an image
  resources :property_images, only: [:create]

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
