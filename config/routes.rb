Rails.application.routes.draw do
  get 'revise/index'


    resources :revise
    match 'revise_update'  => 'revise#update', via: [:get]
    resources :vocab
    match 'vocab_reset'  => 'vocab#reset', via: [:get]

  root 'vocab#index'
end
