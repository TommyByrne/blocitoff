# Preview all emails at http://localhost:3000/rails/mailers/item_mailer
class ItemMailerPreview < ActionMailer::Preview
  def due_soon_preview
    ItemMailer.due_soon(User.find(6))
  end
end
