class DashboardController < ApplicationController
  def dashboard
    @mentorships = Mentorship.where(user: current_user)
    @created_applications = MentorshipApplication.where(user: current_user)
    @received_applications  = MentorshipApplication.where(mentorship: @mentorships)
  end
end
