require "sidekiq/web"

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root to: "employees#index"

  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  resources :employees
  resource :employee_discounts, only: :show
  resource :reports, only: :show
end
