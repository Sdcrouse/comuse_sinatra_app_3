class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  has_many :posts
end
