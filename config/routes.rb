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
get '/holds/destroy_all' => 'holds#destroy_all'
post '/holds/import' => 'holds#import'
resources :holds do
  collection { post :import }
end
post '/transactions/import' => 'transactions#import'
get '/transactions' => 'transactions#index'
# get '/users/process/:id' => 'users#process_user'
get '/users/unprocess/:id' => 'users#unprocess_user'
post '/users/search'
post '/users/process' => 'users#process_user'
get '/users_download' => 'users#users_download'
get '/users/:id' => 'users#view'
get '/holds' => 'holds#index'
get '/international' => 'transactions#international'
get '/key/up' => 'transactions#key_up'
get '/key/down' => 'transactions#key_down'
get '/invoice/up' => 'transactions#invoice_up'
get '/invoice/down' => 'transactions#invoice_down'
get '/agent_id/up' => 'transactions#agent_id_up'
get '/agent_id/down' => 'transactions#agent_id_down'
get '/c2go_id/up' => 'transactions#c2go_id_up'
get '/c2go_id/down' => 'transactions#c2go_id_down'
get '/issue_date/up' => 'transactions#issue_date_up'
get '/issue_date/down' => 'transactions#issue_date_down'
get '/itinerary/up' => 'transactions#itinerary_up'
get '/itinerary/down' => 'transactions#itinerary_down'
get '/active/up' => 'transactions#active_up'
get '/active/down' => 'transactions#active_down'
get '/commission_total/up' => 'transactions#commission_total_up'
get '/commission_total/down' => 'transactions#commission_total_down'
get '/agent_total/up' => 'transactions#agent_total_up'
get '/agent_total/down' => 'transactions#agent_total_down'
get '/upline_total/up' => 'transactions#upline_total_up'
get '/upline_total/down' => 'transactions#upline_total_down'
get '/evo_total/up' => 'transactions#evo_total_up'
get '/evo_total/down' => 'transactions#evo_total_down'
get '/processed/up' => 'transactions#processed_up'
get '/processed/down' => 'transactions#processed_down'
get '/make_upline_transactions' => 'transactions#create_upline_transactions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  collection { post :import }
end
end
