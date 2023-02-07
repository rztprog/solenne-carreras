class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true

  has_many :photographie_contents
  has_one_attached :photo, service: :cloudinary_photographies
end
