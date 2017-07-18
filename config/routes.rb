Rails.application.routes.draw do
root 'products#index'
resources :products do
  collection { post :import }
end
post '/users/import' => 'users#import'
get '/transactions/destroy_all' => 'transactions#destroy_all'
resources :transactions do
  collection { post :import }
end
post '/transactions/import' => 'transactions#import'
post '/holds/import' => 'holds#import'
get '/transactions' => 'transactions#index'
get '/users/process/:id' => 'users#process_user'
get '/users/unprocess/:id' => 'users#unprocess_user'
post '/users/search'
get '/users/:id' => 'users#view'
get '/holds' => 'holds#index'
get '/holds/destroy_all' => 'holds#destroy_all'
get '/international' => 'transactions#international'
get '/key/up' => 'transactions#key_up'
get '/key/down' => 'transactions#key_down'
get '/invoice/up' => 'transactions#invoice_up'
get '/invoice/down' => 'transactions#invoice_down'
get '/agent_id/up' => 'transactions#agent_id_up'
get '/agent_id/down' => 'transactions#agent_id_down'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
