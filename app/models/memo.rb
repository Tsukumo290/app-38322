class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :closet

  validates :content, presence: true
end
