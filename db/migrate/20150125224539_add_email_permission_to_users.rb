class AddEmailPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_due_soon, :boolean, default: true
  end
end
