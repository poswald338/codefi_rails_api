class PostBlueprint < Blueprinter::Base 
  identifier :id
  fields :description, :post_creator, :date

  view :normal do
  end
end