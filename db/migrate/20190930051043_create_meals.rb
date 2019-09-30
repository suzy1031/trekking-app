class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string      :name, null: false
      t.text        :image
      t.integer     :cooking_time, null: false
      t.text        :food_stuff
      t.text        :cooking_method
      t.timestamps
    end
  end
end