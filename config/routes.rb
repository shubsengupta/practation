SpeechApp::Application.routes.draw do

  root 'tests#index'
  get '/dashboard', to: 'main#index'

  match 'api/create' => 'api/users#create', as: :create, via: :post
  match 'api/sign-in' => 'api/users#sign_in', as: :sign_in, via: :post
  match 'api/sign-out' => 'api/users#sign_out', as: :sign_out, via: [:get, :post]


end
