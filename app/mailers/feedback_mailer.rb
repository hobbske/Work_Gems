class FeedbackMailer < ActionMailer::Base
  default to: 'kevin.w.hobbs@gmail.com'

  def feedback_email(name, email, body)
    @name  = name
    @email = email
    @body  = body

    mail(from: email, subject: 'WorkGems Feedback Message')
  end

end