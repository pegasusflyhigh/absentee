Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attendance_entries, only: [:index] do
    collection do
      post 'update_attendance_entries'
    end
  end
end
