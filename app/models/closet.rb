class Closet < ApplicationRecord
  belongs_to :user
  has_many :memos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :color
  belongs_to :season
  belongs_to :size

  validates :image,     presence: true
  validates :brand,     presence: true, length: { maximum: 40 }
  validates :genre_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :color_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :season_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :size_id,   presence: true, numericality: { other_than: 0, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999,
                              message: 'out of setting range' }
  end
end
