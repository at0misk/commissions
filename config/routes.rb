Rails.application.routes.draw do
root 'products#index'
resources :products do
  collection { post :import }
end
post '/users/import' => 'users#import'
post '/transactions/import' => 'transactions#import'
get '/transactions/destroy_all' => 'transactions#destroy_all'
resources :transactions do
  collection { post :import }
end
post '/holds/import' => 'holds#import'
get '/transactions' => 'transactions#index'
get '/users/process/:id' => 'users#process_user'
get '/users/unprocess/:id' => 'users#unprocess_user'
post '/users/search'
get '/users/:id' => 'users#view'
get '/holds' => 'holds#index'
get '/holds/destroy_all' => 'holds#destroy_all'
get '/international' => 'transactions#international'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
