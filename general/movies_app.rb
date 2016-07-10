file_name = ARGV.first
default_name = "movies.txt"
file_name ||= default_name

# проверяем наличие файла и выходим, если он отсутствует
unless File.exist?(file_name)
  puts "File doesn't exist."
  exit
end

# преобразуем строки из нашего файла в массив массивов фильмов
data = file_name
out = open(data)
temp = out.map { |lines| lines.split('|') }

# # преобразуем каждый массив с фильмом в словарь
films = temp.map { |elem|
  {
    url:      elem[0], 
    name:     elem[1], 
    year:     elem[2], 
    country:  elem[3], 
    date:     elem[4], 
    genre:    elem[5], 
    length:   elem[6], 
    rating:   elem[7], 
    director: elem[8], 
    artist:   elem[9]
  }
}

# сортируем массив словарей по длине фильма и отбираем 5 самых длинных
longest_films = films.sort_by { |arr| arr[:length].to_i }.last(5)

# а теперь 10 самых первых по дате выхода комедий
oldest_comedy = films.select { |gen| gen[:genre].include?("Comedy") }.sort_by { |old| old[:date] }.first(10)

# составляем уникальный алфавитный список всех режиссеров
directors = films.map { |dir| dir[:director] }.uniq.sort_by { |sort| sort.split(" ").last }

# считаем, сколько фильмов снято не в США
not_in_usa = films.reject { |cou| cou[:country].include?("USA") }.count

# красиво формируем информацию о фильме
def beautiful(arr)
  arr.each { |i| 
    puts "#{i[:name]} (#{i[:date]}; #{i[:genre]}) / #{i[:length]}" 
  }
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