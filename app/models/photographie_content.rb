class PhotographieContent < ApplicationRecord+
  belongs_to :photographie
  has_one_attached :photo, service: :cloudinary_photographies_content
end
