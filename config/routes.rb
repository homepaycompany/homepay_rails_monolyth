Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "landing" => 'pages#landing_liquidity'
  get "home" => 'pages#landing_transparency'
  get "about" => 'pages#about_us'
  get "how-to" => 'pages#how_to'

  resources :property_forms, only: [:show, :new, :create, :update, :destroy] do
    get "address" => 'property_forms#a_address_validation'
    get "property_type" => 'property_forms#b_property_type_selection'
    put "description_1" => 'property_forms#c_description_1'
    get "description_2" => 'property_forms#d_description_2'
    get "description_3" => 'property_forms#e_description_3'
    get "personnal_information" => 'property_forms#f_personnal_information'
    get "confirmation" => 'property_forms#g_confirmation'
    get "validation" => 'property_forms#h_validation'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
