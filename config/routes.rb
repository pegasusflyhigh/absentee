Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root :to => 'attendance_sheets#index'
    end

    unauthenticated do
      root :to => 'users/sessions#new'
    end
  end

  resources :users, only: [:new, :create, :index, :edit]
  resources :standards, only: [:new, :create, :index, :edit]
  resources :students, only: [:new, :create, :index, :edit]
  resources :attendance_entries, only: [:index]
  post 'messages/received', to: 'messages#received'
end
