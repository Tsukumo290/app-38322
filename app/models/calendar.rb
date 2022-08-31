class Calendar < ApplicationRecord
  belongs_to :user
  has_many_attached :image

  validates :image, presence: true

  FILE_NUMBER_LIMIT = 6

  validate :validate_number_of_files

  private

  def validate_number_of_files
    return if image.length <= FILE_NUMBER_LIMIT
    errors.add(:image, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end