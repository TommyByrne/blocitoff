namespace :todo do
    desc "Delete items past due date"
  task delete_items: :environment do
    Item.where("duedate <=?", Time.now).destroy_all
  end
end
