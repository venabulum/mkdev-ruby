file_name = ARGV.first
default_name = "movies.txt"
file_name ||= default_name
required = "Time"
films = []

# проверяем наличие файла и выходим, если он отсутствует
unless File.exist?(file_name)
  puts "File doesn't exist."
  exit
end

# преобразуем строки из нашего файла в массив
data = file_name
out = open(data)
out.each_line do |lines|
  films.push(lines.split('|'))
end

# если в именах фильмов присутствует required, выводим имя\рейтинг таких фильмов
films.each do |elem|
  if elem[1].include?(required)
    puts "Film: #{elem[1]}\nRating: #{"*" * elem[7].slice(2).to_i}"
  end
end