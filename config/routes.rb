Rails.application.routes.draw do
  root 'boards#index'

  resources :boards do
    resources :lists do
      resources :cards
    end
  end
end