Hesap::Application.routes.draw do

  devise_for :admins, controllers: { sessions: 'hq/sessions',  registrations: 'hq/registrations', passwords: 'hq/passwords' }, path: 'hq',
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification'},
             :skip => [:registrations]
  as :admin do
    get 'hq/edit' => 'hq/registrations#edit', :as => 'edit_admin_registration'
    put 'hq' => 'hq/registrations#update', :as => 'admin_registration'
  end

  namespace :hq do
    root to: 'dashboard#index'
    resource :admin_profile, except: [:destroy], path: 'profile'
    resources :dashboard, only: [:index]
    resources :users, except: [:create, :new] do
      post :block, on: :member
      post :unblock, on: :member
      post :block_all, on: :collection
    end
    resources :admins, except: [:create, :new] do
      post :block, on: :member
      post :unblock, on: :member
      post :block_all, on: :collection
    end
  end

  devise_for :users, path: 'user',
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification'}

  namespace :user do
    resource :user_profile, except: [:destroy], path: 'profile', as: 'profile'
  end

  root to: 'welcome#index'


end
