class Note < ApplicationRecord
  	validates :title, presence: true, length: {minimum: 5}
	validate :image_size_validation
	mount_uploader :image, ImageUploader

	private
		def image_size_validation
			errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
		end
end
