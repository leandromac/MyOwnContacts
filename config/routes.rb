Rails.application.routes.draw do

  get 'home/index'

  # New routes
  get '/tipos' => 'kinds#index'
  get '/contatos' => 'contacts#index'
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
