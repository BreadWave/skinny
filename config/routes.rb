Rails.application.routes.draw do
devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  resources :users do
  	resources :posts do
  		resources :comments
  	end
  end

end
