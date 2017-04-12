Rails.application.routes.draw do
  get 'user/index' => 'user#index'
  post 'user/new' => 'user#new'
  post 'user' => 'user#create'
  get  'user.:id'=> 'user#show'

  root 'user#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
