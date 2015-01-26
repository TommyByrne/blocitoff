every 1.day, :at => '4:30 am' do
  rake  "todo:delete_items"
  rake  "todo:email_due_soon"
end

