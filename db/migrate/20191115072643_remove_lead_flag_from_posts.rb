class RemoveLeadFlagFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :lead_flag, :integer
  end
end
