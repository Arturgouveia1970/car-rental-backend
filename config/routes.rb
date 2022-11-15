Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :api do
    namespace :v1 do
      resources :users, only:  [:index, :show] do
      end
    end
  end
end