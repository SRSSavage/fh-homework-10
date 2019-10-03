Rails.application.routes.draw do
  namespace :api do
    resources :players
    resources :teams
    resources :games
  end

  root to: 'api/players#index'
end
