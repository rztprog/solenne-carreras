class Content < ApplicationRecord
  validates :photos, presence: true

  belongs_to :photographie, dependent: :destroy

  has_many_attached :photos, service: :cloudinary_photographie_contents
end
