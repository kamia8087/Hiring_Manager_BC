class ApplicationsController < ApplicationController
  before_action :logged_in_user

  def new
    @application = current_user.applications.new
    @candidate = Candidate.new
  end

  def index
    if params[:search]
      @applications = Application.where('assigned_to LIKE ?', "%#{params[:search]}%")
    else
      @applications = Application.all
    end
    @candidates = Candidate.all
    @users = User.all
  end

  def show
    @application = Application.find(params[:id])
    @candidate = Candidate.find_by(id: @application.candidate_id)
    @interview = Interview.new
    @feedback = Feedback.new
  end

  def create 
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      @application = current_user.applications.new(application_params)
      @application.candidate_id = @candidate.id
        if @application.save
          redirect_to @application
        else
          render 'new'
        end
    end
  end

  private

    def application_params
      params.require(:application).permit(:experience, :qualification, :contact_number,
                                   :exp_salary, :notice_period, :assigned_to, :status, :user_id, :candidate_id)
    end
    def candidate_params
      params[:application][:candidates].permit(:name, :email, :dob, :gender)
    end
end
