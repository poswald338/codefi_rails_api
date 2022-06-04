# frozen_string_literal: true

module BaseApi
  module Users
    def self.new_user(params)
      user = User.new(
        human_name: params[:human_name],
        email: params[:email],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        pet_name: params[:pet_name],
        pet_nickname: params[:pet_nickname],
        breed: params[:breed],
        bio: params[:bio],
        birthday: params[:birthday],
        password: params[:password],
        photo: params[:photo]
      )
      user.save!
      return ServiceContract.error('Error saving user.') unless user.valid?

      ServiceContract.success(user)
    end
    def self.new_prof_pic(user, params)
      
      user.photo.attach(params)
      user.save!
      return ServiceContract.error('Error saving user.') unless user.valid?

      ServiceContract.success(user)
    end

    def self.get_user(id)
      user = User.find(id)
      return ServiceContract.error('Could not find user.') unless user

      ServiceContract.success(user)
    end

    def self.destroy_user(user_id)
      user = User.find(user_id)
      return ServiceContract.error('Error deleting user') unless user.destroy

      ServiceContract.success(payload: user)
    end

    def self.follow_user(id, user)
      user.following << id if !user.following.to_set.include?(id)
      user.save!
      return ServiceContract.error('Error following user.') unless user.valid?

      ServiceContract.success(user)
    end
    def self.unfollow_user(id, user)
      user.following.delete(id) if user.following.to_set.include?(id)
      user.save!
      return ServiceContract.error('Error following user.') unless user.valid?

      ServiceContract.success(user)
    end

  end
end