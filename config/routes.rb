Rails.application.routes.draw do

  mount Base => '/'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
