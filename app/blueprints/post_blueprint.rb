class PostBlueprint < Blueprinter::Base 
  identifier :id
  fields :description, :post_creator, :date, :post_img_path

  view :normal do
  end
end