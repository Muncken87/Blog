class Post < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validate :image_size_validation

  private

  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 3.megabytes
  end

end
