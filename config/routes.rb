FbPagesfetcher::Application.routes.draw do


  resources :pages, :only => [:index, :show, :create]

  root :to => 'pages#index'
end
