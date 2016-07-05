file_name = ARGV.first
default_name = "movies.txt"
file_name ||= default_name
required = "Time"
films = []

# проверяем файл
if File.exist?(file_name)
  data = file_name
# преобразуем строки из нашего файла в массив
  out = open(data)
  out.each_line do |lines|
  films.push(lines.split('|'))
  end
else
  puts "File doesn't exist."
end

# если в именах фильмов присутствует required, выводим имя\рейтинг таких фильмов
films.each do |elem|
  if elem[1].include?(required)
    puts "Film: #{elem[1]}\nRating: #{"*" * elem[7].slice(2).to_i}"
  end
end