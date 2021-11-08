class AddStatusToGroupWord < ActiveRecord::Migration[5.2]
  def change
    add_column :group_words, :status, :integer
  end
end
