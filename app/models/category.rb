class Category < ApplicationRecord
  validates_presence_of :name, :user_id
  
  has_many :ads
  belongs_to :user
end
