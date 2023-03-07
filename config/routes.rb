Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get '/', to: 'user#login'
  get 'login/:name', to: 'users#login'
  get 'api/v1/users/car/:id', to: 'users#user_car'
  post 'register', to: 'users#register'

  namespace :api do
    namespace :v1 do
      resources :cars
      resources :reservations
    end
  end
end