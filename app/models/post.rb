class Post < ActiveRecord::Base
  has_many :comments
  attr_accessible :title, :content, :image
  has_attached_file :image, styles: { medium: '400x400>' }
end
