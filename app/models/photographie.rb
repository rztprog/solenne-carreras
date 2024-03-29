class Photographie < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  validate :validate_photo_filetype

  has_many :contents, dependent: :destroy

  has_one_attached :photo, service: :cloudinary_photographies

  private

  def photo_attachement(index)
    target = photo[index]
    return unless photos.attached?

    if target.image?
      target.variant(resize_to_limit: [150, 150]).processed
    end
  end

  def validate_photo_filetype
    return unless photo.attached?

    unless photo.image?
      errors.add(:photo, "must be an image")
    end
  end
end
