class AddWorldToCountry < ActiveRecord::Migration[6.0]
  def change
    add_reference :countries, :world, foreign_key: true
  end

end

# # THIS CODE WAS RUN IN THE RAILS CONSOLE
# # create a new world; add every country to that world
# world = World.find(1)
# Country.all.each { |country| country.world = world }
