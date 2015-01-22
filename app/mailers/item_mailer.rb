class ItemMailer < ActionMailer::Base
  default from: "tbyrn687@gmail.com"

    def due_soon(user, list, item)
      mail(to: user.email, subject: "You have some To-do Due soon!")
    end
end
