# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
films = JSON.parse(user_serialized)

films_array = films['results']

films_array.each do |film|
  movie = Movie.new(title: film['title'], overview: film['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{film['poster_path']}", rating: film['vote_average'])
  movie.save
end
