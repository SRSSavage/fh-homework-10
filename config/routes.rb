Rails.application.routes.draw do
  post 'player_token' => 'player_token#create'
  devise_for :players
  namespace :api do
    resources :players
  end

  root to: 'api/players#index'
end
