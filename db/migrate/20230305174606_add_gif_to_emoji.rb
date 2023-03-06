class AddGifToEmoji < ActiveRecord::Migration[7.0]
  def change
    add_column :emojis, :gif, :string
  end
end
