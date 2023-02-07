class PhotographieContent < ApplicationRecord
  belongs_to :photography
  has_one_attached :photo, service: :cloudinary_photographies_content
end
