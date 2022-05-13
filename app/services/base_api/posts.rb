module BaseApi
  module Posts
    def self.create_post(params)
      post = Post.new(
        description: params,
        user_id: 1
      )
      post.save!
      return ServiceContract.error('Error saving user.') unless post.valid?

      ServiceContract.success(post)

    end
  end
end