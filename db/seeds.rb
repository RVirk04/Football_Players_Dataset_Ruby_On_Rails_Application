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
  content: "The dataset in this application is taken from the site Kaggle. This application will fetch fetch the data from the csv file and formats it in to the table with a lot functiionlaity. So, footballers is all about the data of players.",
  permalink: "about"
)

puts "Created #{Country.count} countries."
puts "Created #{Player.count} players."
