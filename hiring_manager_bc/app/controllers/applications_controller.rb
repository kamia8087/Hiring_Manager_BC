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
    @interviews = Interview.all
    @app_interviews = @interviews.where(application_id: params[:id])
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

  def edit
    @application = Application.find(params[:id])
    @candidate = Candidate.find_by(id: @application.candidate_id)
  end

  def update
    @application = Application.find(params[:id])
    byebug
    if @application.update_attributes(application_params)
      flash[:success] = "Profile updated"
      redirect_to @application
    else
      render 'edit'
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    flash[:success] = "Application deleted"
    redirect_to applications_path
  end

  def approve_applicant
    @application = Application.find(params[:id])
    @application.update_attributes(status: "Approved")
    redirect_to @application
  end

  def reject_applicant
    @application = Application.find(params[:id])
    @application.update_attributes(status: "Rejected")
    redirect_to @application
  end
  
  private

    def application_params
      params.require(:application).permit(:experience, :qualification, :contact_number,
                                   :exp_salary, :notice_period, :assigned_to, :status, :user_id, :candidate_id, :resume)
    end
    def candidate_params
      params[:application][:candidates].permit(:name, :email, :dob, :gender)
    end
end
