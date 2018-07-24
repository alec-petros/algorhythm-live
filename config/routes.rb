Rails.application.routes.draw do
  root to: 'sessions#home'
  resources :artists, only: [:show]
  resources :comments, only: [:new, :create, :show]
  resources :comments, only: [:show]
  resources :genres, only: [:show]
  resources :tracks, only: [:show]
  resources :playlists
  resources :users, only: [:create, :destroy, :show, :edit, :update]
  get '/signup', to: 'users#new', as: "signup"
  get '/login', to: 'sessions#new'
  get '/help', to: 'sessions#help'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/playlists/:id/generate', to: 'playlists#generate'
  post 'playlists/fix', to: 'playlists#fix'
  post 'playlists/:id/edit_fix', to: 'playlists#edit_fix'
  post 'playlists/:id/save', to: 'playlists#save'
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/about', to: 'sessions#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
