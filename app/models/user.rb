class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :list
  has_many :items

  def items_due_soon
    items.due_soon
  end

  def score
    items.only_deleted.count - items.count
  end

  def self.by_score
    all.sort_by { |user| user.score }.reverse
  end
end