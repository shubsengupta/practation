SpeechApp::Application.routes.draw do
  root 'tests#index'

  get '/dashboard', to: 'main#index'
end
