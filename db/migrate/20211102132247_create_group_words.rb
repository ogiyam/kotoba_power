class CreateGroupWords < ActiveRecord::Migration[5.2]
  def change
    create_table :group_words do |t|
      t.integer :user_id
      t.integer :group_id
      t.text :word

      t.timestamps
    end
  end
end
