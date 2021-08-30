class Ad < ApplicationRecord
  validates_presence_of :category_id, :user_id, :title, :description
  
  belongs_to :user
  belongs_to :category

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

end
