Rails.application.routes.draw do
  root to: "admin/dashboard#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :announcements,:assignments,:events, :members, :positions, :posts, :post_comments, :tasks
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
end
