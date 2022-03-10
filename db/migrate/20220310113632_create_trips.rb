class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.references :country, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :notes
      t.string :type
    end
  end
end
