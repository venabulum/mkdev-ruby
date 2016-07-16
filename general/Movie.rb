class Movie

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
    # метод должен уметь отвечать на запрос has_genre?('Comedy')
  end

end