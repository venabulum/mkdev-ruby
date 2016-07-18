require_relative 'Movie'
require_relative 'MovieCollection'

movies = MovieCollection.new
# puts movies.all
# puts movies.all.first.actors
# puts movies.all.first(5).map(&:genre)
# puts movies.all.last.title
# puts movies.sort_by(:genre)
# puts movies.sort_by(:year)
# puts movies.sort_by(:rating)
# puts movies.all.first.has_genre?('Drama')
# puts movies.filter(genre: 'Comedy')
# puts movies.filter(actors: 'Freeman')
# puts movies.all.select { |m| m.has_genre?('Drama') }
# puts movies.stats(:director).map { |m| m.flatten.join(' -> ') }
# puts movies.stats(:year).map { |m| m.flatten.join(' -> ') }
# puts movies.stats(:date).map { |m| m.flatten.join(' -> ') }
# puts movies.filter(year: 1994, country: 'USA')
# puts movies.filter(country: 'France')
puts movies.filter(genre: 'Mumu')