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
    if @genre.include?(genre)
      "#{@genre} - TRUE"
    else
      "#{@genre} - FALSE"
    end
  end

  def to_s
    "#{@title} (#{@year}, #{@country}) / #{@genre} / #{@director} / #{@actors} (#{@rating})"
  end

end