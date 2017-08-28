class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      name  = params[:feedback][:name]
      email = params[:feedback][:email]
      body  = params[:feedback][:comments]
      FeedbackMailer.feedback_email(name, email, body).deliver

      flash[:success] = "Feedback Successfully Sent."
      redirect_to new_feedback_path

    else
      flash[:danger] = "Error! Feedback Not Sent."
      redirect_to new_feedback_path
    end

  end

  private
    def feedback_params
      params.require(:feedback).permit(:name, :email, :comments)
    end

end