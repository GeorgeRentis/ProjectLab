class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :email, use: :slugged
  has_many :images, as: :uploadable, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :lessons,dependent: :destroy
  has_many :lesson_ratings
  accepts_nested_attributes_for :images, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable
  enum role_id: [ :admin, :user ]
  validates :first_name,:last_name,:email, presence: true
  validates :email,uniqueness: true
  

end
