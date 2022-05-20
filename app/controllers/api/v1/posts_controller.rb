module Api
  module V1

    class PostsController < Api::V1::ApplicationController
      
      def create
        result = Posts.create_post(get_params, @current_user)
          render_error(errors: 'There was a problem creating a new user', status: 400) and return unless result.success?
          payload = {
            post: PostBlueprint.render_as_hash(result.payload, view: :normal)
          }
          render_success(payload: payload)
      end

      private

      def get_params
        params.require(:post).permit(:description)
      end
    end
  end
end