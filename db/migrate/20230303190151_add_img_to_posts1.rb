class AddImgToPosts1 < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image_name1, :string
  end
end
