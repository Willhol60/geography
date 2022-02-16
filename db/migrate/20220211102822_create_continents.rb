require 'json'

class CreateContinents < ActiveRecord::Migration[6.0]
  def change
    create_table :continents do |t|
      t.string :name
      t.timestamps
    end

    seed_continents

    export_countries

    # remove the continent column from the country model
    remove_column :countries, :continent, :string
  end

  def seed_continents
    ['North America', 'South America', 'Europe', 'Africa', 'Asia', 'Oceania', 'Antarctica'].each do |continent|
      Continent.create(name: continent)
    end
  end

  def export_countries
    hash = Country.continent_hash

    File.open("country_migration.json", "w") do |f|
      f.write(hash.to_json)
    end
  end
end

# add in the associations

# import_countries

def import_countries
  # countries = JSON.parse("country_migration.json")
end
