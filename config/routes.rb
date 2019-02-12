Rails.application.routes.draw do
  #root to: "admin/dashboard#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #get 'pages/home'

  root 'pages#home'
  get 'quienes_somos'  => 'pages#quienes_somos'
  get 'home' => 'pages#home'
  get 'que_hacemos' => "pages#que_hacemos"
  get 'proximos_eventos' => "pages#proximos_eventos"
  get 'contactenos' => "pages#contactenos"
  get '/admins/sign_up' => 'devise/registrations#new'
  get '/admins/sign_in' => 'devise/sessions#create'
  get '/admins/sign_out' => 'devise/sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'announcements/by/:member_id' => "management#announcement_by_members"
      get 'tasks/by/:member_id' => "management#tasks_by_members"
      post '/upload' => "upload#upload_profile_pic"
      get 'get_id' => "management#get_member_id_from_user"
      get 'get_registered_events/:member_id' => "management#get_registered_events"
      get 'get_member_metrics/:member_id' => "management#get_member_metrics"
      get 'get_tasks_event/:event_id' => "management#get_tasks_for_event"
      resources :announcements,:assignments,:events, :members, :positions, :posts, :post_comments, :tasks
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
end
