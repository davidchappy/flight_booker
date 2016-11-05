class PassengerMailer < ApplicationMailer

  def thank_you(user)
    @user = user
    @login_url = 'http://localhost:3000/login'

    mail(to: @user.email, subject: 'Welcome to Flight Booker!')
  end
end
