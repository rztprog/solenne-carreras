class PhotographieContent < ApplicationRecord
  belongs_to :photographie
  
  validates :photo, presence: true

  has_one_attached :photo, service: :cloudinary_photographies_content
end
