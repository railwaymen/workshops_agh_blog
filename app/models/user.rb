class User < ActiveRecord::Base
  devise :database_authenticatable, :validatable
  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, :name, presence: true
end