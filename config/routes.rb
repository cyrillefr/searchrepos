Rails.application.routes.draw do
  resources :repos, only: [:index]

  get '/search', to: 'repos#search'
end
