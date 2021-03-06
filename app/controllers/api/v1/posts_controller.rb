module Api
  module V1

    class PostsController < Api::V1::ApplicationController
      # skip_before_action :authenticate, only: [:index]
      
      def create
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

      def post_by_id
        result = Posts.get_post(params[:id])
        render_error(errors: 'There was a problem retrieving post', status: 400) and return unless result.success?
        payload = {
          post: PostBlueprint.render_as_hash(result.payload, view: :normal)
        }
        #  TODO: Invite user to accept invitation via registered email
        render_success(payload: payload)
      end

      def like_post
        result = Posts.handle_likes(params[:id], @current_user)
        render_error(errors: 'There was a problem retrieving post', status: 400) and return unless result.success?
        payload = {
          post: PostBlueprint.render_as_hash(result.payload, view: :normal)
        }
        #  TODO: Invite user to accept invitation via registered email
        render_success(payload: payload)
      end

      def unlike_post
        result = Posts.handle_likes(params[:id], @current_user)
        render_error(errors: 'There was a problem retrieving post', status: 400) and return unless result.success?
        payload = {
          post: PostBlueprint.render_as_hash(result.payload, view: :normal)
        }
        #  TODO: Invite user to accept invitation via registered email
        render_success(payload: payload)
      end

      private

      def get_params
        params.permit(:description, :photo, :format)
      end
    end
  end
end