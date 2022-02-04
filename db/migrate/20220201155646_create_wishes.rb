class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.string :target_date
      t.integer :budget
      t.string :invited
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
