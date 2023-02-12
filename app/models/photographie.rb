class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  has_one :content, optional: true

  has_one_attached :photo, service: :cloudinary_photographies
end
