Rails.application.routes.draw do

  post '/movies/search_tmdb'

  # for testing javascript with jasmine
  mount JasmineFixtureServer => '/spec/javascripts/fixtures' if defined?(Jasmine::Jquery::Rails::Engine)
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/twitter', as: 'login'

  resources :movies do
    resources :reviews
  end

  root to: redirect('/movies')
end
