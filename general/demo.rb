require_relative 'Movie'
require_relative 'MovieCollection'

movies = MovieCollection.new

puts movies.all

puts movies.all.first.actors
puts movies.all.first(5).map(&:genre)

puts movies.sort_by(:genre)
puts movies.sort_by(:year)

begin
  puts movies.all.first.has_genre?('Comedy')
  puts movies.all.first.has_genre?('Drama')
  puts movies.all.first.has_genre?('Cococo')
rescue Exception => error
  puts error
end

puts movies.filter(genre: 'Comedy')
puts movies.filter(actors: 'Hanks', genre: 'Comedy', year: 2010)

puts movies.stats(:year).map { |m| m.flatten.join(' -> ') }
puts movies.stats(:date).map { |m| m.flatten.join(' -> ') }