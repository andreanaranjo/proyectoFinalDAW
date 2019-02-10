Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :announcements,:assignments,:events, :members, :positions, :posts, :post_comments, :tasks
    end
  end
end
