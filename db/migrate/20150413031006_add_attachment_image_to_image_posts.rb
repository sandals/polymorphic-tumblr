class AddAttachmentImageToImagePosts < ActiveRecord::Migration
  def self.up
    change_table :image_posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_posts, :image
  end
end
