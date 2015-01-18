class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, length: {minimum: 5}
end
