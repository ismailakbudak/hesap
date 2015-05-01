Hesap::Application.routes.draw do

  devise_for :admins, controllers: {sessions: 'hq/sessions',  registrations: 'hq/registrations' }, path: 'hq',
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification'}

  namespace :hq do
    root to: 'dashboard#index'
    resource :admin_profile, except: [:destroy], path: 'profile'
    resources :dashboard, only: [:index]
  end

  devise_for :users, path: 'user',
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification'}

  namespace :user do
    resource :user_profile, except: [:destroy], path: 'profile', as: 'profile'
  end

  root to: 'welcome#index'


end
