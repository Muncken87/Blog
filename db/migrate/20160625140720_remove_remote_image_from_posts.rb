class RemoveRemoteImageFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :remote_image_url, :string
  end
end
