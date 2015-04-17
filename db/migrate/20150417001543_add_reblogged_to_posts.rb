class AddRebloggedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reblogged, :integer
  end
end
