class Movie

  attr_accessor :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def initialize(url, title, year, country, date, genre, length, rating, director, actors)
    @url        = url     
    @title      = title   
    @year       = year    
    @country    = country 
    @date       = date    
    @genre      = genre   
    @length     = length  
    @rating     = rating  
    @director   = director
    @actors     = actors
  end

  def has_genre?(genre)
    begin
      @movies.map { |m| m.genre.include?(genre) }[0].empty?
    rescue StandardError=>e
      puts 'There is no such genre #{e}'
    else
      @genre.include?(genre)
    end
  end

  def to_s
    "#{@title} (#{@date}, #{@country}) / #{@genre} / #{@director} / #{@actors} (#{@rating})"
  end

end