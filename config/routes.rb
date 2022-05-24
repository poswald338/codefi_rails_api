Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        delete :logout
        get :me
        post :create
        post :update_profile_pic
      end
      resources :posts, only: [:create, :update, :destroy, :index]
      namespace :posts do
        get :post_by_id
      end
    end
  end
end
