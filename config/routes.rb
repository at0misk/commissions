Rails.application.routes.draw do
root 'products#index'
resources :products do
  collection { post :import }
end
post '/users/import' => 'users#import'
post '/transactions/import' => 'transactions#import'
resources :transactions do
  collection { post :import }
end
get '/transactions' => 'transactions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
