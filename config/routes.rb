Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "landing" to: 'pages#landing_liquidity'
  get "home" to: 'pages#landing_transparency'
  get "about" to: 'pages#about_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
