class Item < ActiveRecord::Base

  belongs_to :user

  validates :character, :description, :date, presence: true

end