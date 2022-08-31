class Calendar < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :start_time, presence: true
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 6, message: 'は1枚以上6枚以下にしてください' }
end
