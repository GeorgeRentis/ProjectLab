class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true, touch: true
  mount_uploader :upload, UploadUploader
end
