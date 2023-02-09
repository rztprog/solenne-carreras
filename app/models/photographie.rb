class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  has_many :photographie_contents, dependent: :destroy

  has_one_attached :photo, service: :cloudinary_photographies
end
