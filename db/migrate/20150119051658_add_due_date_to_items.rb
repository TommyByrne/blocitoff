class AddDueDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :duedate, :datetime
  end
end
