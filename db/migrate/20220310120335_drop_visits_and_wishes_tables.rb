class DropVisitsAndWishesTables < ActiveRecord::Migration[6.0]
  def up
    drop_table :visits
    drop_table :wishes
  end

  def down
    create_table :visits do |t|
      t.string :date
      t.text :notes
      t.references :country, null: false, foreign_key: true
    end

    create_table :wishes do |t|
      t.string :target_date
      t.integer :budget
      t.string :invited
      t.references :country, null: false, foreign_key: true
    end
  end
end
