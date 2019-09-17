Rails.application.routes.draw do
  post 'player_token' => 'player_token#create'
  post 'user_token' => 'user_token#create'
  namespace :api do
    resources :players
  end

  root to: 'api/players#index'
end
