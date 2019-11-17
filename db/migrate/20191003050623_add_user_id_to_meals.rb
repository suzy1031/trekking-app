class AddUserIdToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :user_id, :integer, null: false
  end
end
