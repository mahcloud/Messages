Rails.application.routes.draw do
  resources :messages

  devise_for :users, :controllers => {:sessions => 'sessions'}
  root to: 'home#index'
end
