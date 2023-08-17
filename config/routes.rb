Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  # get '/', to: 'user#login'
  # get 'login/:name', to: 'users#login'
  # get 'api/v1/users/car/:id', to: 'users#user_car'
  # post 'register', to: 'users#register'

  # namespace :api do
  #   namespace :v1 do
  #     resources :cars
  #     resources :reservations
  #   end
  # end

  root to: redirect('/api-docs')


  post 'api/v1/sign_up/:name/:email/:password', to: 'users#register'
  get 'api/v1/users/sign_in/:email/:password', to: 'users#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy register login ] do
        resources :reservations, only: %i[index show create]
      end
      resources :cars, only: %i[index show create destroy] do
        resources :reservations, only: %i[index show create]
      end
    end
  end
end