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
films = CSV.read(file_name, write_headers: true, headers: KEYS, col_sep: '|')
  .map { |value| OpenStruct.new(value.to_h) }

# сортируем массив словарей по длине фильма и отбираем 5 самых длинных
longest_films = films.sort_by { |film| film.length.to_i }.last(5)

# а теперь 10 самых первых по дате выхода комедий
oldest_comedy = films.select { |film| film.genre.include?("Comedy") }.sort_by { |film| film.date }.first(10)

# составляем уникальный алфавитный список всех режиссеров
directors = films.map(&:director).uniq.sort_by { |full_name| full_name.split(' ').last }

# считаем, сколько фильмов снято не в США
not_in_usa = films.reject { |film| film.country.include?("USA") }.count

# красиво формируем информацию о фильме
def beautiful(arr)
  arr.each { |film| puts "#{film.name} (#{film.date}; #{film.genre}) / #{film.length}" }
end

# заголовок
def header(str)
  puts "= = = #{str.upcase} = = ="
end

# разделитель
def delimeter
  puts "------------------------------------------------------" 
end

# выводим итоговый результат
header('top 5 longest films')
beautiful(longest_films)
delimeter
header('top 10 oldest comedy films')
beautiful(oldest_comedy)
delimeter
header('a list of all directors')
puts directors
delimeter
header('shot not in the us')
puts  "#{not_in_usa} films out of 250"
delimeter
header('release stat')
films.map(&:date).select { |date| date.length > 4 }
  .group_by { |date| Date._parse(Date.strptime(date, '%Y-%m').to_s)[:mon] }.sort
  .each { |month, films| puts "#{films.count} films was released in #{Date::MONTHNAMES[month]}" }