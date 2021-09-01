class MentorshipApplicationsController < ApplicationController
  # def index
    # Im going to gather all the existing mentorships so I can give them to the view to display (by storing the mentorships in an instance variable)
  #   @applications = MentorshipApplication.where(user_id: 3)
  # end

  def show
    # @mentorship = Mentorship.find(params[:mentorship_id])
    @application = MentorshipApplication.find(params[:id])
    @applicant = User.find(@application[:user_id])
  end

  def new
    @mentorship = Mentorship.find(params[:mentorship_id])
    @application = MentorshipApplication.new
  end

  def create
    @mentorship = Mentorship.find(params[:mentorship_id])
    @application = MentorshipApplication.new(application_params)
    @user = current_user
    @application.mentorship_id = @mentorship[:id]
    @application.user_id = @user[:id]
    @application.status = 'Pending'
    if @application.save
      # redirect to dashboard
      redirect_to mentorship_application_path(@application)
    else
      render :new
    end
  end

  def update
    @application = MentorshipApplication.find(params[:id])
    if @application.update(application_params)
      redirect_to @application, notice: 'Application status was successfully updated.'
    else
      render :show
    end
  end

  private

  def application_params
    params.require(:mentorship_application).permit(:message, :status)
  end
end
