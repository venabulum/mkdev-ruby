require 'csv'
require 'ostruct'
require 'date'

class MovieCollection
  
  KEYS = [:url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors] 
  attr_accessor :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def initialize(file_name = ARGV.first)
    default_name = 'movies.txt'
    file_name ||= default_name

    unless File.exist?(file_name)
      puts "File doesn't exist."
      exit
    end

    @movies = CSV.read(file_name, write_headers: true, headers: KEYS, col_sep: '|').map { |value| OpenStruct.new(value.to_h) }
    .map { |movie| Movie.new(movie.url, movie.title, movie.year, movie.country, movie.date, movie.genre, movie.length, movie.rating, movie.director, movie.actors) }
  end

  def all
    @movies
  end

  def sort_by(value)
    @movies.sort_by(&value)
  end

  def filter(hash)
    @movies.select { |movies| movies.(hash.keys.first).include?(hash.values.first) }
  end

  def stats(key)
    # метод должен уметь выдать статистику по запросу: режиссёр, актёр, год, месяц, страна, жанр 
    # например, movies.stats(:director) возвращает хеш «имя режиссёра → количество фильмов»
  end

  def to_s
   "#{@movies}"
  end

end