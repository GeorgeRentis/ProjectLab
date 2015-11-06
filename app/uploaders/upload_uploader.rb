# encoding: utf-8

class UploadUploader < CarrierWave::Uploader::Base

  include Sprockets::Rails::Helper
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :full do
    process resize_to_limit: [600, 600]
  end


  version :homepage do
    process resize_to_fill: [232, 232]
  end

  version :small do
    process resize_to_fit: [120, 120]
  end

  version :cover do
    process resize_to_fit: [340, 340]
  end

  version :product_show do
    process resize_to_limit: [460, nil]
    #process :resize_to_width => [460, nil]

  end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  IMAGE_EXTENSIONS = %w(jpg jpeg gif png)
  DOCUMENT_EXTENSIONS = %w(exe pdf doc docm docx xls rar zip)
  def store_dir
    
    "#{model.uploadable_type.downcase.pluralize}/#{Lesson.find(model.uploadable_id).title
}"
  end
  def extension_white_list
    IMAGE_EXTENSIONS + DOCUMENT_EXTENSIONS
  end


end
