class NotificationMailer < ApplicationMailer
	 default from: "jobportal@domain.com"

  def job_application_confirmdation_to_user(user)
    @user = user
    mail(to: @user.email, subject: 'Your Application successfully recieved')
  end

  def job_application_notification_to_organisation(user,employment)
    @user = user
    @employment =employment
    mail(to: @user.email, subject: 'Soemone applied for your job opening')
  end

  def interview_schedule_notification(user,interview)
  	@interview = interview
    @user = user
    mail(to: @user.email, subject: 'Your interview has been scheduled')
  end
end
