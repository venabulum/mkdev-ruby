require 'csv'

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
    .map { |m| Movie.new(self, m[:url], m[:title], m[:year], m[:country], m[:date], m[:genre], m[:length], m[:rating], m[:director], m[:actors]) }
    @all_genres = @movies.map(&:genre)
  end

  def all
    @movies
  end

  def sort_by(value)
    @movies.sort_by(&value)
  end

  def filter(filters)
    filters.reduce(@movies) { |result, (key, value)|
    result.select {|movies| movies.send(key).include?(value.to_s) } }
  end

  def stats(value)
    @movies.group_by(&value)
    .map { |key, movies| { key => movies.count } }
  end

  def to_s
   "#{@movies}"
  end

  def genre_exists?(genre)
    @all_genres.include?(genre)
  end

end