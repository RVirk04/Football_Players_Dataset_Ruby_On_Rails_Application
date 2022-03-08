# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

# Deletes the player, club, and country records without instantiating the records first.
Player.delete_all
Country.delete_all
Page.delete_all

# Add the file path of the csv file.
filepath = Rails.root.join("db/players.csv")

# Print out the full filepath of players.csv file.
# puts filepath

# Read the players.csv file, the whole file, line by line, or a specific amount of bytes.
csv_data = File.read(filepath)

data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# Read the each player short name from the file.
data.each do |c|
  # puts c["short_name"]

  # country = Country.create(name: ["nationality"])
  country = Country.find_or_create_by(name: c["nationality"])
  if country && country.valid?
    # Create a new player
    player = country.players.create(
      name: c["short_name"],
      position: c["team_position"],
      overall: c["overall"]
    )
    puts "Invalid player #{c["short_name"]}" unless player&.valid?
  else
    puts "Invalid country #{c["country"]}for the player #{c['short_name']}"
  end
end

Page.create(
  title: "About Footballers",
  content: "This application takes the data from Kaggle in the form of csv file. And later on,
  parse it into the models database. This dataset contains three tables which are Players,
  countries, and clubs. The players can has country as well as club but club can have many
  players and countries can have many as well as players. The players table include 5 columns
  player name, nationality, club, position, overall. Afterthat countries contains one column
  just name and same for the club table as well.",
  permalink: "about"
)

puts "Created #{Country.count} countries."
puts "Created #{Player.count} players."
