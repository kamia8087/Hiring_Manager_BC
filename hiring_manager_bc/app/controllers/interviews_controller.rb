class InterviewsController < ApplicationController
    before_action :logged_in_user

    def new
        @interview = Interview.new
    end

    def create
        @application = Application.find(params[:interview][:application_id])
        byebug
        @user = User.find_by(id: @application.user_id)
        @interview = current_user.interviews.build(interview_params)
        @interview.application_id = @application.id
        if @interview.save
            UserMailer.new_interview(@user).deliver_now
            flash[:success] = "Interview created!"
            redirect_to @application
        else
            render 'applications/show'
        end
    end

    def destroy
    end

    private

    def interview_params
      params.require(:interview).permit(:interview_type, :assignee)
    end
end
