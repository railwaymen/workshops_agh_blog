class User < ActiveRecord::Base
  devise :database_authenticatable, :validatable, :omniauthable
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :comments
  validates :email, :name, presence: true

  def password_required?
    new_record? && facebook_uid.nil?
  end
end