Rails.application.routes.draw do
  resources :users, param: :_username
  get '/cep/:cep', to: 'cep#search', cep: /[0-z\.\-]+/
  get '/history', to: 'cep#history'
  post '/auth/login', to: 'authentication#login'
  get '*/a', to: 'application#not_found'
end
