Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  get 'home/index'

  # Search route
  get 'search', to: 'search#contacts'

  # New routes
  get '/tipos' => 'kinds#index'
  get '/enderecos' => 'addresses#index'
  get '/telefones' => 'phones#index'

  root 'home#index'

  # resources cria as rotas para cada view automaticamente
  # index, edit, show, new
  resources :phones
  resources :addresses
  resources :contacts
  resources :kinds
end
