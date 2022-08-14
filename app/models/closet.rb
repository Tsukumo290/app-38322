class Closet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,     presence: true
  validates :brand,     presence: true
  validates :price,     presence: true
  validates :genre_id,  presence: true
  validates :color_id,  presence: true
  validates :season_id, presence: true
  validates :size_id,   presence: true
end
