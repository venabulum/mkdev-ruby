require_relative 'Movie'
require_relative 'MovieCollection'

movies = MovieCollection.new
puts movies.all
puts movies.all.first.actors
puts movies.sort_by(:genre)
puts movies.sort_by(:year)
puts movies.sort_by(:rating)