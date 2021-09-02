class DashboardController < ApplicationController
  def dashboard
    @mentorships = Mentorship.where(user: current_user)
    @created_applications = MentorshipApplication.where(user: current_user)
    @received_applications = MentorshipApplication.where(mentorship: @mentorships)
    @mentor_count = mentor_count(MentorshipApplication.where(status: "Accepted"))
    @subject_count = subject_count(MentorshipApplication.where(status: "Accepted"))
    @active = active_mentorships(@received_applications)
    @inactive = inactive_mentorships(@received_applications)
    @pending = pending_mentorships(@received_applications)
  end

  private

  def mentor_count(mentorships)
    mentors = []
    mentorships.each do |ment|
      mentors << ment.mentor if ment.user == current_user
    end
    return mentors.uniq.count
  end
  def subject_count(mentorships)
    subjects = []
    mentorships.each do |ment|
      subjects << ment.mentorship.subject if ment.user == current_user
    end
    return subjects.uniq.count
  end
  def active_mentorships(ment_app)
    active = []
    ment_app.each do |app|
      if app.mentor == current_user && app.status == "Accepted"
        active << app
      end
    end
    active.uniq.count
  end
  def inactive_mentorships(ment_app)
    inactive = []
    ment_app.each do |app|
      if app.mentor == current_user && app.status != "Accepted"
        inactive << app
      end
    end
    inactive.uniq.count
  end
  def pending_mentorships(ment_app)
    pending = []
    ment_app.each do |app|
      if app.mentor == current_user && app.status == "Pending"
        pending << app
      end
    end
    pending.uniq.count
  end
end
