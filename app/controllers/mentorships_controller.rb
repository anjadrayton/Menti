class MentorshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @mentorships = Mentorship.search_by_subject(params[:query])
    else
      @mentorships = Mentorship.all
    end

    @markers = @mentorships.geocoded.map do |mentorship|
      {
        lat: mentorship.latitude,
        lng: mentorship.longitude,
        info_window: render_to_string(partial: "info_window", locals: { mentorship: mentorship })
      }
    end
  end

  def show
    @mentorship = Mentorship.find(params[:id])
  end

  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentorship = Mentorship.new(mentorship_params)
    @user = User.find(current_user.id)
    @mentorship.user = @user
    if @mentorship.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @mentorship = Mentorship.find(params[:id])
  end

  def update
    @mentorship = Mentorship.find(params[:id])
    if @mentorship.update(mentorship_params)
      redirect_to @mentorship, notice: 'Mentorship offer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @mentorship = Mentorship.find(params[:id])
    @mentorship.destroy
    redirect_to dashboard_path
  end

  private

  def mentorship_params
    params.require(:mentorship).permit(:subject, :description, :address, :photo)
  end
end
