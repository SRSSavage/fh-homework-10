Rails.application.routes.draw do
  devise_for :players
  post 'player_token' => 'player_token#create'

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :players
  end

  root to: 'api/players#index'
end
