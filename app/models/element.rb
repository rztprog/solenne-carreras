class Element < ApplicationRecord
  validates :photos, presence: true
  validate :validate_photos_filetype

  belongs_to :graphisme

  has_many_attached :photos, service: :cloudinary_graphisme_elements

  private

  def photo_attachement(index)
    target = photos[index]
    return unless photos.attached?

    if target.image?
      target.variant(resize_to_limit: [150, 150]).processed
    end
  end

  def validate_photos_filetype
    return unless photos.attached?
  
    photos.each do |photo|
      unless photo.image?
        errors.add(:photos, "must be an image")
      end
    end
  end
end
