module Api
  module V1

    class PostsController < Api::V1::ApplicationController
      # skip_before_action :authenticate, only: [:create]
      
      def create
        byebug
        result = Posts.create_post(get_params, @current_user)
          render_error(errors: 'There was a problem creating a new user', status: 400) and return unless result.success?
          payload = {
            post: PostBlueprint.render_as_hash(result.payload, view: :normal)
          }
          render_success(payload: payload)
      end

      def index
        result = Posts.get_all_posts(params, @current_user)
          render_error(errors: 'There was a problem creating a new user', status: 400) and return unless result.success?
          payload = {
            post: PostBlueprint.render_as_hash(result.payload, view: :normal)
          }
          render_success(payload: payload)
      end

      private

      def get_params
        params.permit(:description, :photo)
      end
    end
  end
end