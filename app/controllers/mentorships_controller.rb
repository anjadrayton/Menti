class MentorshipsController < ApplicationController
  def index
    # Im going to gather all the existing mentorships so I can give them to the view to display (by storing the mentorships in an instance variable)
    @mentorships = Mentorship.all
  end

  def show
    @mentorship = Mentorship.find(params[:id])
  end

  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentorship = Mentorship.new(mentorship_params)
    @user = User.find(1)
    @mentorship.user = @user
    # raise
    if @mentorship.save
      redirect_to mentorship_path(@mentorship)
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
    redirect_to mentorships_path
  end

  private

  def mentorship_params
    params.require(:mentorship).permit(:subject, :description)
  end
end
