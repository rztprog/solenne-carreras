class Retouche < ApplicationRecord
  validates :before_photo, presence: true
  validates :after_photo, presence: true
  validate :validate_photo_filetype

  has_one_attached :before_photo, service: :cloudinary_retouches
  has_one_attached :after_photo, service: :cloudinary_retouches

  private

  def validate_photo_filetype
    return unless before_photo.attached? && after_photo.attached?

    unless before_photo.image? && after_photo.image?
      errors.add(:before_photo, "must be an image")
      errors.add(:after_photo, "must be an image")
    end
  end
end
