Rails.application.routes.draw do
  get 'revise/index'


    resources :revise
    match 'revise_update'  => 'revise#update', via: [:get]
    resources :vocab
    match 'vocab_reset'  => 'vocab#reset', via: [:get]
    resources :story
  root 'vocab#index'
end
