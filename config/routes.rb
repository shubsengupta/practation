SpeechApp::Application.routes.draw do

  root 'login#index'
  match '/test' => 'texts#index', via: :get
  match '/dashboard' => 'main#index', via: :get

  match 'api/user/create' => 'api/users#create', via: :post
  match 'api/user/sign-in' => 'api/users#sign_in', as: :sign_in, via: :post
  match 'api/user/sign-out' => 'api/users#sign_out', as: :sign_out, via: [:get, :post]

  match '/api/presentation/' => 'api/users/#index', via: :get
  match '/api/presentation/show' => 'api/users/#show', via: :get

  match 'api/presentation/create' => 'api/presentations#create', via: :post

end
