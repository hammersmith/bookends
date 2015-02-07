Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    get 'users/pending_registration' => 'registrations#pending'
  end
  root to: 'catalogs#home'
  
  resources :works do
    collection do
      get :check_inventory
    end
  end

end
