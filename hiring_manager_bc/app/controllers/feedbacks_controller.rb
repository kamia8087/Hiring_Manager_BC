class FeedbacksController < ApplicationController
  def index
    @interviews = Interview.all
    @feedbacks = Feedback.all
  end

  def create
    @application = Application.find_by(params[:id])
    @user = User.find_by(id: @application.user_id)
    @interviews = Interview.find_by(application_id: @application.id)
    @feedback = @interviews.feedbacks.new(feedback_params)
    if @feedback.save
      byebug
      UserMailer.new_feedback(@user).deliver_now
      flash[:info] = "Please check your email to."
      redirect_to @application
    else
      redirect_to @application
    end
  end


  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
