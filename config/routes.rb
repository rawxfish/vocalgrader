Vocalgrader::Application.routes.draw do
  get "trials/new"

  root to: 'pages#home'
end
