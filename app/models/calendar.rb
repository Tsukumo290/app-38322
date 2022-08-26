class Calendar < ApplicationRecord
  belongs_to :user
  has_many_attached :image

  validates :image, presence: true
  validates :start_time, presence: true

end
