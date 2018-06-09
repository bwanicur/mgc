class UserActivationMailer < ApplicationMailer
 
  def activation_needed_email(user)
    @user = user
    mail(to: @user.email, subject: "Please activate your My Gig Calendar Account")
  end
  
  def activation_success_email(user)
    @user = user
    mail(to: @user.email, subject: "Your My Gig Calendar Account has been activated!")
  end

end
