Rails.application.routes.draw do
  get "/users/sign_in", to: redirect("/")
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    root 'users/sessions#new'
    get '/sign_up' => 'users/registrations#new'
  end
  get '/dashboard' => "users#dashboard", as: :user_root
  post '/start_session' => "users#start_session"
  get '/get_daily_sessions' => "users#get_daily_sessions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
