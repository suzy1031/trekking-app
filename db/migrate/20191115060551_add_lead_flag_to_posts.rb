class AddLeadFlagToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lead_flag, :integer
  end
end
