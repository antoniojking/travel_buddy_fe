Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'


  resources :explore, only: [:index, :show]

  get '/user_dashboard', to: 'users#show'

  get '/trip_dashboard', to: 'trips#show'

end
