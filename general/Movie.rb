class Movie

  attr_accessor :movies, :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def initialize(movies, url, title, year, country, date, genre, length, rating, director, actors)
    @movies     = movies
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
    raise "'#{genre}' genre does not exist." unless movies.genre_exists?(genre)
    @genre.include?(genre)
  end

  def to_s
    "#{@title} (#{@date}, #{@country}) / #{@genre} / #{@director} / #{@actors} (#{@rating})"
  end

end