module Api
  module V1

    class PostsController < Api::V1::ApplicationController
      skip_before_action :authenticate, only: %i[login create]
      
      def create
        result = BaseApi::Posts.create_post(params[:description])
          render_error(errors: 'There was a problem creating a new user', status: 400) unless result.success?
          payload = {
            post: PostBlueprint.render_as_hash(result.payload, view: :normal)
          }
          render_success(payload: payload)
      end
    end
  end
end