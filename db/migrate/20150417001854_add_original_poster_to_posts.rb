class AddOriginalPosterToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :original_poster, :integer
  end
end
