class MentorshipApplication < ApplicationRecord
  belongs_to :user
  belongs_to :mentorship
end
