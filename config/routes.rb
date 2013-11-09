SpeechApp::Application.routes.draw do

  root 'login#index'
  match '/test' => 'tests#index', via: :get
  match '/dashboard' => 'main#index', via: :get

  match 'api/user' => 'api/users#index', via: :get
  match 'api/user/create' => 'api/users#create', via: :post
  match 'api/user/sign-in' => 'api/users#sign_in', as: :sign_in, via: [:get, :post]
  match 'api/user/sign-out' => 'api/users#sign_out', as: :sign_out, via: [:get, :post]

  match '/api/presentations' => 'api/presentations#index', via: :get
  match '/api/presentations/show' => 'api/presentations#show', via: :get

  match 'api/presentations/create' => 'api/presentations#create', via: [:get, :post]

end
