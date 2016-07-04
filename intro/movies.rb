# simple version

bad_movie = "Titanic"
good_movie = "Matrix"

input = ARGV.first

if input == bad_movie 
  puts "#{input} is a bad movie"
elsif input == good_movie 
  puts "#{input} is a good movie"
else
  puts "Haven't seen #{input} yet"  
end


# hard version

bad_movie = "Titanic"
good_movies = ["Matrix", "Pulp Fiction"]

input = ARGV.first

if input == bad_movie 
  puts "#{input} is a bad movie"
elsif good_movies.include?(input)
  puts "#{input} is a good movie"
else
  puts "Haven't seen #{input} yet"  
end