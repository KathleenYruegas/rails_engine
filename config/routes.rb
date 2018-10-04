Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get ':id/favorite_merchant', to: 'favorite_merchant#show'
        get 'random', to: 'random#show'
      end

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end

      namespace :merchants do
        get 'most_revenue', to: 'most_revenue#index'
        get 'most_items', to: 'most_items#index'
        get 'revenue', to: 'revenue#show'
      end

      resources :customers, only: [:index, :show]

      resources :invoices, only: [:index, :show]

    end
  end
end
