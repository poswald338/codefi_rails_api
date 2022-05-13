class PostBlueprint < Blueprinter::Base 
  identifier :id
  fields :description, :user_id

  view :normal do
    fields :description, :user_id
  end
end