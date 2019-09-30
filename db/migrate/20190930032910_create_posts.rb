class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string      :name, null: false
      t.text        :text, null: false
      t.text        :image
      t.integer     :elevation
      t.integer     :walking_distance
      t.integer     :difficulty
      t.timestamps
    end
  end
end
