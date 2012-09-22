Vocalgrader::Application.routes.draw do
  resources :trials

  root to: 'pages#home'
end
