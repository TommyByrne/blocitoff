class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  default_scope { order('created_at ASC')}

  validates :name, length: { minimum: 5}

  def days_left
    (duedate.to_date- DateTime.now.to_date).to_i
  end
end