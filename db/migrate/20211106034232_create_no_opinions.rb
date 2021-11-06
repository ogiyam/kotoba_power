class CreateNoOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :no_opinions do |t|
      t.integer :group_word_id

      t.timestamps
    end
  end
end
