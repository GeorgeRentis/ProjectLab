class Image < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true, touch: true
  mount_uploader :upload, ImageUploader
end
