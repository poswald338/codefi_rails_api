module Posts
  def self.create_post(params, current_user)
    byebug
    post = current_user.posts.new(
      description: params,
      user_id: 1
    )
    return ServiceContract.error('Error saving user.') unless post.save

    ServiceContract.success(post)

  end
end