# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "destroying existing data"

Country.destroy_all

puts "accessing the API"
url = "https://restcountries.com/v3.1/all"
countries = JSON.parse(URI.open(url).read)

puts "got every country in the world"

puts "building the database now"

countries.each do |country|
  languages = country["languages"].values || "none"
  Country.create(
    name: country["name"]["common"],
    flag: country["flags"]["png"],
    capital: country["capital"] || "unknown",
    region: country["region"],
    subregion: country["subregion"],
    continent: country["continents"][0],
    languages: languages,
    population: country["population"],
    timezone: country["timezones"][0],
    borders: country["borders"] || "no borders/island"
  )
  puts "added #{country['name']['common']}"
end
