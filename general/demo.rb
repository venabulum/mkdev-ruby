require_relative 'Movie'
require_relative 'MovieCollection'

movies = MovieCollection.new

puts movies.all

puts movies.all.first.actors
puts movies.all.first(5).map(&:genre)

puts movies.sort_by(:genre)
puts movies.sort_by(:year)

puts movies.all.first.has_genre?('Drama')
puts movies.all.first.has_genre?('Cococo')

puts movies.filter(genre: 'Comedy')
puts movies.filter(actors: 'Hanks', genre: 'Comedy', year: 2010)

puts movies.stats(:year).map { |m| m.flatten.join(' -> ') }
puts movies.stats(:date).map { |m| m.flatten.join(' -> ') }
