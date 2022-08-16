class Closet < ApplicationRecord
  belongs_to :user
  has_many :memos, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :color
  belongs_to :season
  belongs_to :size

  validates :image,     presence: true
  validates :brand,     presence: true
  validates :price,     presence: true
  validates :genre_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :color_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :season_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :size_id,   presence: true, numericality: { other_than: 0, message: "can't be blank" }
end
