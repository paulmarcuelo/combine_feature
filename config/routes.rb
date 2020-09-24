Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :carts, only: [:create, :update, :index]
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  get 'room/:id', to: 'room#show'

  post 'message', to:'message#crt', as: 'message_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
