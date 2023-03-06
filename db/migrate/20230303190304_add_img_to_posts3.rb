class AddImgToPosts3 < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image_name3, :string
  end
end
