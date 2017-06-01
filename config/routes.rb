Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  get "events/login" => "events#login"
  post "events/verify" => "events#verify"
  get "boss/logout" => "boss#logout"

  resources :events,:boss
end

