class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates_uniqueness_of :user_id, scope: %i[image_id]
end
