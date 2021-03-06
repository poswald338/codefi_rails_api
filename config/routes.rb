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
        get :get_user_by_id
        post :follow
        post :unfollow
      end
      resources :posts, only: [:index]
      namespace :posts do
        post :create
        get :post_by_id
        delete :remove
        post :edit
        post :like_post
        post :unlike_post
      end
    end
  end
end
