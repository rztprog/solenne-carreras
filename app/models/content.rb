class Content < ApplicationRecord
  validates :photos, presence: true
  validate :validate_photos_filetype

  belongs_to :photographie

  has_many_attached :photos, service: :cloudinary_photographie_contents

  private

  def validate_photos_filetype
    return unless photos.attached?
  
    photos.each do |photo|
      unless photo.image?
        errors.add(:photos, "must be an image")
      end
    end
  end
end
