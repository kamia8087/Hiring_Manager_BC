class FeedbacksController < ApplicationController
  def index
    @interviews = Interview.all
    @feedbacks = Feedback.all
  end

  def create
    @application = Application.find_by(params[:id])
    @interviews = Interview.find_by(application_id: @application.id)
    @feedback = @interviews.feedbacks.new(feedback_params)
    if @feedback.save
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
