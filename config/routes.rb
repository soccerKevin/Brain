Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tic-tac-toe' => 'tic_tac_toe#show'
end
