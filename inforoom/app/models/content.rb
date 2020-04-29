class Content < ApplicationRecord
  self.per_page = 2
  
  belongs_to :user
  has_one_attached :video
  has_one_attached :thumbnail
end
