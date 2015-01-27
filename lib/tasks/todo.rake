namespace :todo do
    desc "Delete items past due date"
  task delete_items: :environment do
    Item.where("duedate <=?", Time.now).destroy_all
  end

    desc "Email Tasks due soon"
  task email_due_soon: :environment do
    User.all.each do |user|
        if user.items.due_soon.count > 0
          ItemMailer.due_soon(user).deliver
        end
      end
    end
  end
