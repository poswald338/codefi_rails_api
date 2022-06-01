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
    if params[:filter] == "my_posts"
      posts = current_user.posts
    else
      ids = current_user.following
      ids.push(current_user.id)
      posts = Post.where(user_id: current_user.following).order('created_at DESC')
    end
    return ServiceContract.error('Error retrieving posts.') unless posts

    ServiceContract.success(posts)
  end

  def self.get_post(id)
    post = Post.find_by(id: id)

    return ServiceContract.error('Error retrieving post.') unless post

    ServiceContract.success(post)
  end

  def self.handle_likes(id, user)
    post = Post.find(id)
    if !post.likes.to_set.include?(user.id)
      post.likes << user.id
    else
      post.likes.delete(user.id)
    end
    return ServiceContract.error('Error saving user.') unless post.save

    ServiceContract.success(post)
  end
end