Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "landing" => 'pages#landing_liquidity'
  get "home" => 'pages#landing_transparency'
  get "about" => 'pages#about_us'

  resources :property_forms, only: [:show, :create, :update, :destroy] do
    get "address" => 'property_forms#address_validation'
    get "description_1" => 'property_forms#description_1'
    put "description_2" => 'property_forms#description_2'
    get "description_3" => 'property_forms#description_3'
    get "description_4" => 'property_forms#description_4'
    get "personnal_informations" => 'property_forms#personnal_informations'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
