Rails.application.routes.draw do
  root "engineerings#index"
  resources :engineerings do
    resources :specializations
  end
end
