class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :flag
      t.string :capital
      t.string :region
      t.string :subregion
      t.string :continent
      t.string :languages
      t.integer :population
      t.string :timezone
      t.string :borders

      t.timestamps
    end
  end
end
