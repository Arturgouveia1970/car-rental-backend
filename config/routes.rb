Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'login/:name', to: 'users#login'
  get 'api/v1/users/car/:id', to: 'users#user_car'
  post 'register', to: 'users#register'

  # namespace :api do
  #   namespace :v1 do
  #     resources :users do
  #       resources :reservations
          
  #     end
  #     resources :cars do
        
  #       resources :reservations
  #     end  
  #   end       
  # end

  # namespace :api do
  #   namespace :v1 do
  #     resources :reservations, only: [:index, :show, :edit, :create, :update, :destroy, :cars]
  #   end
  # end
 
  # namespace :api, defaults: {format: 'json'} do
  #   namespace :v1 do
  #     resources :cars do
  #       resources :reservations
  #     end
  #   end
  # end

  namespace :api do
    namespace :v1 do
      resources :cars
      resources :reservations
    end
  end
end