class UserImage < ActiveRecord::Base
  has_many :images, as: :uploadable,dependent: :destroy
  accepts_nested_attributes_for :images,allow_destroy: true
end
