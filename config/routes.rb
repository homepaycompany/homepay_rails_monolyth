Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "landing" => 'pages#landing_liquidity'
  get "home" => 'pages#landing_transparency'
  get "about" => 'pages#about_us'

  resources :property_forms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
