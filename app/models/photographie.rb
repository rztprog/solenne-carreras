class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  has_one_attached :photo, service: :cloudinary_photographies
  has_many :photographie_contents
end
