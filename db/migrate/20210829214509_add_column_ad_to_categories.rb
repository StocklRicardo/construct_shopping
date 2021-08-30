class AddColumnAdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :user_id, :int, index: true
  end
end
