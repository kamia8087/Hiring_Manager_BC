class InterviewsController < ApplicationController
    before_action :logged_in_user
    def create
        @application = Application.find_by(params[:id])
        @interview = current_user.interviews.build(interview_params)
        @interview.application_id = @application.id
        if @interview.save
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
