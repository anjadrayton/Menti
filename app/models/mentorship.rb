class Mentorship < ApplicationRecord
  belongs_to :user
  has_many :mentorship_application
end
