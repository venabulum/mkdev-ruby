require 'csv'
require 'ostruct'
require 'date'

class MovieCollection
  
  KEYS = [:url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors] 

  def initialize(file_name = ARGV.first)
    default_name = 'movies.txt'
    file_name ||= default_name

    unless File.exist?(file_name)
      puts "File doesn't exist."
      exit
    end

    @movies = CSV.read(file_name, write_headers: true, headers: KEYS, col_sep: '|').map(&:to_h)
    .map { |m| Movie.new(m[:url], m[:title], m[:year], m[:country], m[:date], m[:genre], m[:length], m[:rating], m[:director], m[:actors]) }
  end

  def all
    @movies
  end

  def sort_by(value)
    @movies.sort_by(&value)
  end

  def filter(hash)
    @movies.select { |movies| movies.send(hash.keys.first).include?(hash.values.first) }
  end

  def stats(value)
    @movies.group_by(&value)
    .each { |key, quantity| puts "#{key}: #{quantity.count}" }
  end

  def to_s
   "#{@movies}"
  end

end