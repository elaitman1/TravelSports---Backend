Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :trips, only: [:index, :show, :create, :update, :destroy] do
          resources :experiences, only: [:show, :create, :update]
        end
      end
      resources :games, only: [:index, :show]
      resources :teams, only: [:index, :show]
      resources :transportations, only: [:index, :show]
      resources :hotels, only: [:index, :show]

      post "/login", to: "users#login"
    end
  end
end
