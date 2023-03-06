class AddQuoteIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :quote_id, :integer
  end
end
