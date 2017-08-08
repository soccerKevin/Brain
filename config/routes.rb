Rails.application.routes.draw do
  get '/tic-tac-toe' => 'tic_tac_toe#show'
  resources :neuron
end
