class MentorshipApplication < ApplicationRecord
  belongs_to :user
  belongs_to :mentorship
  has_one :mentor, through: :mentorship, source: :user
end
