Rails.application.routes.draw do
  resources :police_reports
  devise_for :users
  scope 'api/v1', module: 'v1', as: 'v1' do
    resources :users, :only => [:show, :create, :update]
    resources :bikes, :only => [:show, :create, :update]
    resources :police_reports, :only => [:show, :create, :update]

    match '*all' => 'api#preflight_check', via: :options, as: :preflight_check
  end
end
