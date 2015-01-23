class Item < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :list
  belongs_to :user

  default_scope { order('created_at ASC')}
  scope :due_soon, -> { where("duedate <= ? ", Date.today + 3 ) }

  validates :name, length: { minimum: 5}

  def days_left
    (duedate.to_date - Date.today).to_i
  end

  def due_soon
    if ((duedate.to_date - DateTime.now.to_date).to_i <= 2)
    end
  end
end