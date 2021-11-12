class AddUserIdToYesOpinion < ActiveRecord::Migration[5.2]
  def change
    add_column :yes_opinions, :user_id, :integer
  end
end
