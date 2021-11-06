class CreateYesOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :yes_opinions do |t|
      t.integer :group_word_id

      t.timestamps
    end
  end
end
