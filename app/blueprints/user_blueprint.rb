# Defines the JSON blueprint for the User model
class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :human_name, :email, :city, :state, :zip, :pet_name, :pet_nickname, :breed, :bio, :birthday, :photo_url, :followers, :following

  view :login do
    association :token, blueprint: TokenBlueprint do |user, _options|
      user.tokens.last
    end
  end

  view :normal do
    # fields :first_name, :last_name, :name, :email, :phone
  end

end