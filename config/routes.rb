Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "landing" => 'pages#landing_liquidity'
  get "home" => 'pages#landing_transparency'
  get "about" => 'pages#about_us'
  get "how-to" => 'pages#how_to'

  resources :property_forms, only: [:new, :show] do
    put "description_1" => 'property_forms#description_1'
    put "description_2" => 'property_forms#description_2'
    put "description_3" => 'property_forms#description_3'
    put "description_4" => 'property_forms#description_4'
    put "personnal_informations" => 'property_forms#personnal_informations'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
