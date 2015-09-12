class CarImage < ActiveRecord::Base
	belongs_to :car 
	mount_uploader :image, ImageUploader
	validates :image, :presence => true
	validate :file_size

  def file_size
    if image.file.size.to_f/(1000*1000) > 5
      errors.add(:file, "You cannot upload a file greater than 5MB")
    end
  end
end
