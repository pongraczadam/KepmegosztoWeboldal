class Tag < ApplicationRecord
  belongs_to :image

  validates_uniqueness_of :name, scope: %i[image_id]
end
