module Posts
  def self.create_post(params, current_user)
    post = current_user.posts.new(
      description: params[:description],
      user_id: current_user[:id],
      photo: params[:photo]
    )
    return ServiceContract.error('Error saving user.') unless post.save

    ServiceContract.success(post)

  end

  def self.get_all_posts(params, current_user)
    byebug
    if params[:filter] == "my_posts"
      posts = current_user.posts
    else
      posts = Post.where(user_id: current_user.following).order('created_at DESC')
    end
    return ServiceContract.error('Error retrieving posts.') unless posts

    ServiceContract.success(posts)
  end
end