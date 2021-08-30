class AddColumnPriceToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :price, :float
  end
end
