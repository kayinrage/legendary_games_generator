Lgg::Application.routes.draw do
  root 'generator#show'
  resource :generator, only: [:show, :create], controller: 'generator'
end
