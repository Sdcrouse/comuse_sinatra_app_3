class Post < ActiveRecord::Base
  belongs_to :user

  # validates new post inputs
  validates :title, :description, :image_url, presence: true

end
