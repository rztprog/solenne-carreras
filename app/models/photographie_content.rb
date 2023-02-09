class PhotographieContent < ApplicationRecord
  validates :photo, presence: true
  
  belongs_to :photographie

  has_one_attached :photo, service: :cloudinary_photographie_contents
end
