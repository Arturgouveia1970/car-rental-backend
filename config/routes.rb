Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/api-docs')

  # register and login paths
  post 'api/v1/register/:name/:email', to: 'users#register'
  get 'api/v1/users/login/:email', to: 'users#login'
  
  # Car endpoints
  get 'api/v1/cars', to: 'cars#index'
  get 'api/v1/car/:id', to: 'cars#show'
  post 'api/v1/car', to: 'cars#create'
  delete 'api/v1/car/:id', to: 'cars#delete'
  get 'api/v1/reserve/cars/:date', to: 'cars#reserve'
  get 'api/v1/cars/:user_id', to: 'cars#user_cars'

  # Reservation endpoints
  post 'api/v1/reservation/:user_id/:car_id/:city/:start_date', to: 'reservations#create'
  get 'api/v1/reservations/:user_id', to: 'reservations#index'

  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :users, only: %i[index show create update destroy register login ] do
  #       resources :reservations, only: %i[index show create]
  #     end
  #     resources :cars, only: %i[index show create destroy] do
  #       resources :reservations, only: %i[index show create]
  #     end
  #   end
  # end
end
