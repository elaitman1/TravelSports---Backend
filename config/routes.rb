Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :trips, only: [:index, :show, :create, :update, :destroy] do
          resources :experiences, only: [:show, :create, :update]
        end
      end
      resources :games, only: [:index, :show]
    end
  end
end
