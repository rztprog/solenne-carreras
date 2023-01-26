class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  has_one_attached :photo
end
