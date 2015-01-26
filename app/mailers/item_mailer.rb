class ItemMailer < ActionMailer::Base
  default from: "tbyrn687@gmail.com"

  def due_soon(user)
    @user = user


    mail(to: @user.email, subject: "You have things to do")
  end
end