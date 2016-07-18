require_relative 'Movie'
require_relative 'MovieCollection'

movies = MovieCollection.new
puts movies.all
puts movies.all.first.actors
puts movies.all.first(5).map(&:genre)
puts movies.all.last.title
puts movies.sort_by(:genre)
puts movies.sort_by(:year)
puts movies.sort_by(:rating)
puts movies.all.first.has_genre?('Comedy')
puts movies.filter(genre: 'Comedy')
puts movies.filter(actors: 'Freeman')
puts movies.all.select { |m| m.has_genre?('Drama') }
movies.stats(:director)
movies.stats(:year)
movies.stats(:date)