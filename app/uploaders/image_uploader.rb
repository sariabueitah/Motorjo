# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end
  version :thumb do
    process :resize_and_pad => [109, 78, "#CACDD0", Magick::CenterGravity]
  end
  version :homepage_carousel do
    process :resize_and_pad => [230, 162, "#CACDD0", Magick::CenterGravity]
  end
  version :search do
    process :resize_and_pad => [213, 150, "#CACDD0", Magick::CenterGravity]
  end
  version :special_car do
    process :resize_and_pad => [287, 133, "#CACDD0", Magick::CenterGravity]
  end
  version :special_car_main do
    process :resize_and_pad => [470, 286, "#CACDD0", Magick::CenterGravity]
  end
  version :car_main do
    process :resize_and_pad => [470, 338, "#CACDD0", Magick::CenterGravity]
  end
  version :search_special do
    process :resize_and_pad => [137, 99, "#CACDD0", Magick::CenterGravity]
  end

  # Add a white list of extensions which ar,  allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
