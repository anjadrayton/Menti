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
    @week_app = list(@received_applications)
    @week_mentor = week_mentors(@created_applications)
    @week_mentorships = week_mentorships(@received_applications)
    # raise
  end

  private

  def week_mentorships(created_applications)
    mentorships = []
    created_applications.each do |ment|
      mentorships << ment.mentor if within_week(ment.updated_at)
    end
    return mentorships.uniq.count
  end

  def mentors(created_applications)
    mentors = []
    created_applications.each do |ment|
      mentors << ment.mentor if ment.user == current_user
    end
    return mentors.uniq.count
  end
  def week_mentors(created_applications)
    mentors = []
    created_applications.each do |ment|
      mentors << ment.mentor if within_week(ment.updated_at)
    end
    return mentors.uniq.count
  end

  def list(group)
    arr = []
    group.each do |app|
      arr << app if within_week(app.updated_at)
    end
    arr.count
  end

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

  def within_week(time)
    difference = Time.now - time
    difference / 3600 < 168
  end
end
