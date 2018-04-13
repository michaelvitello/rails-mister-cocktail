Rails.application.routes.draw do

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :destroy, :create]
  end

  root "cocktails#index"

end
