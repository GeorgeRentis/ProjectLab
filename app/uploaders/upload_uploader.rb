# encoding: utf-8

class UploadUploader < CarrierWave::Uploader::Base

  include Sprockets::Rails::Helper

  

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog
 
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
