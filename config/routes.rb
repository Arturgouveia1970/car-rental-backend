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

  root 'api/v1/users#index'
  post 'api/v1/register/:name/:email/:password', to: 'users#sign_up'
  post 'api/v1/users/login/:email/:password', to: 'users#sign_in'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy login register ] do
        resources :reservations, only: %i[index show create]
      end
      resources :cars, only: %i[index show create destroy] do
        resources :reservations, only: %i[index show create]
      end
    end
  end
end