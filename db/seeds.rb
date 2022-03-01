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

# Add the file path of the csv file.
filepath = Rails.root.join("db/players.csv")

# Print out the full filepath of players.csv file.
# puts filepath

# Read the players.csv file, the whole file, line by line, or a specific amount of bytes.
csv_data = File.read(filepath)

data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# Read the each player short name from the file.
data.each do |c|
  # puts p["short_name"]
  # country = Country.find_or_create_by(country: p["nationality"])
  # player = Player.find_or_create_by(
  #   player: p["short_name"],
  #   country: p["nationality"],
  #   club: p["club"],
  #   position: p["nation_position"],
  #   overall: p["overall"]
  #   )


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

puts "Created #{Country.count} countries."
puts "Created #{Player.count} players."
