class AddImgToPosts2 < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image_name2, :string
  end
end
