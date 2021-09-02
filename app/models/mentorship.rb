class Mentorship < ApplicationRecord
  belongs_to :user
  has_many :mentorship_application, dependent: :destroy
  has_one_attached :photo
end
