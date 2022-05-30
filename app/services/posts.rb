module Posts
  def self.create_post(params, current_user)
    post = current_user.posts.new(
      description: params[:description],
      user_id: current_user[:id]
    )
    return ServiceContract.error('Error saving user.') unless post.save

    ServiceContract.success(post)

  end

  def self.get_all_posts(params, current_user)
    if params[:filter] == "my_posts"
      posts = current_user.posts
    else
      posts = Post.all.order('created_at DESC')
    end
    return ServiceContract.error('Error retrieving posts.') unless posts

    ServiceContract.success(posts)
  end
end