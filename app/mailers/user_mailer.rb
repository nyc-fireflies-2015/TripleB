class UserMailer < ActionMailer::Base
	default from: 'triplebteams@gmail.com'

  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://triplb.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Tripl_B')
  end
end
