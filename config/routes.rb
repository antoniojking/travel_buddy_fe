Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources 'explore', only: [:index]

  get '/user_dashboard', to: 'users#show'

  get '/auth/spotify/callback', to: 'sessions#create'

  namespace :trips do
    resources :dashboard, only: [:show, :create, :update] do
      resources :checklist, only: [:show, :create] do
        resources :checklist_items, only: [:create, :update, :destroy]
      end
      resources :accommodations
      resources :travel_buddies, only: [:create]
    end
  end

  post '/friendships', to: 'friendships#create'

  get '/parks/:park_code', to: 'parks#show', as: 'parks_show'
end
