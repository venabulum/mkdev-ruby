require 'csv'
require 'ostruct'
require 'date'

file_name = ARGV.first
default_name = 'movies.txt'
file_name ||= default_name

# проверяем наличие файла и выходим, если он отсутствует
unless File.exist?(file_name)
  puts "File doesn't exist."
  exit
end

# преобразуем строки из нашего файла в словарь фильмов
KEYS = [:url, :name, :year, :country, :date, :genre, :length, :rating, :director, :artist]
films = CSV.read(file_name, col_sep: '|').map { |value| OpenStruct.new(KEYS.zip(value).to_h) }

# сортируем массив словарей по длине фильма и отбираем 5 самых длинных
longest_films = films.sort_by { |film| film.length.to_i }.last(5)

# а теперь 10 самых первых по дате выхода комедий
oldest_comedy = films.select { |film| film.genre.include?("Comedy") }.sort_by { |film| film.date }.first(10)

# составляем уникальный алфавитный список всех режиссеров
directors = films.map { |film| film.director }.uniq.sort_by { |full_name| full_name.split(' ').last }

# считаем, сколько фильмов снято не в США
not_in_usa = films.reject { |film| film.country.include?("USA") }.count

# красиво формируем информацию о фильме
def beautiful(arr)
  arr.each { |film| puts "#{film.name} (#{film.date}; #{film.genre}) / #{film.length}" }
end

# разделитель между фильмами
def delimeter
  puts "------------------------------------------------------" 
end

# выводим итоговый результат
puts "= = = TOP 5 LONGEST FILMS = = ="
beautiful(longest_films)
delimeter
puts "= = = TOP 10 OLDEST COMEDY FILMS = = ="
beautiful(oldest_comedy)
delimeter
puts "= = = A LIST OF ALL DIRECTORS = = ="
puts directors
delimeter
puts "= = = SHOT NOT IN THE US = = ="
puts  "#{not_in_usa} films out of 250"
delimeter
puts "= = = MONTHS STAT = = ="
films.map { |film| film.date }.select { |date| date.length > 4 }.group_by { |date| Date._parse(date)[:mon] }.each { |month, films| puts "In #{month} month was released #{films.count} films" }