class Graphisme < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_one_attached :photo, service: :cloudinary_graphismes
end
