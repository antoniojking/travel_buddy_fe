Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources 'explore', only: [:index, :show]

  get '/user_dashboard', to: 'users#show'

  get '/auth/spotify/callback', to: 'sessions#create'

  namespace :trips do
    resources :dashboard, only: [:show, :create] do
      resources :checklist, only: [:show, :create]
      resources :accommodations
    end
  end

  get '/parks/:park_code', to: 'parks#show'
end
