class AddUserIdToNoOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :no_opinions, :user_id, :integer
  end
end
