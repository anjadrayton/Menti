class Mentorship < ApplicationRecord
  belongs_to :user
  has_one :mentorship_application
end
