class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  belongs_to :user
  has_many :lesson_ratings,dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :comments,dependent: :destroy
  accepts_nested_attributes_for :uploads, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :lesson_ratings, allow_destroy: true
  validates :title,:category,:description, presence: true
  
  def self.search(search)

    if search
      self.where('title LIKE ?',"%#{search}%")
    else
      self.all
    end
  end
end
