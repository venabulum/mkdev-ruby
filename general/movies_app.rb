file_name = ARGV.first
default_name = "movies.txt"
required = "Time"
films = []

# проверяем файл
if file_name
  if File.exist?(file_name)
    data = file_name
  else
    puts "File doesn't exist."
  end
else
  data = default_name 
end

# преобразуем строки из нашего файла в массив
out = open(data)
out.each_line do |lines|
  films.push(lines.split('|'))
end

# проверяем, что в именах фильмов наличие required, и выводим имя\рейтинг таких фильмов
i = 0
while i < films.length do
  if films[i][1].include?(required)
    puts "Name: #{films[i][1]}"
    rating = films[i][7].slice(2).to_i
    print "Rating: "
    rating.times {print "*"}
    puts "\n"
  end
  i += 1
end