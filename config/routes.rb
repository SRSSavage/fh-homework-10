Rails.application.routes.draw do
  namespace :api do
    resources :players
  end

  root to: 'api/players#index'
end
