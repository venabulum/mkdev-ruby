require_relative 'movie_collection'
require_relative 'movie'

class Netflix < MovieCollection

  attr_accessor :wallet

  def initialize
    super
    @wallet = 0
  end

  def show(suggestions)
    movie = randomaizer(filter(suggestions))
    raise "You don't have enough money" if movie.price > self.wallet
    withdraw(movie.price)
  end

  def pay(dollars)
    raise "Something went wrong" if dollars <= 0
    self.wallet += dollars
  end

  def withdraw(dollars)
    self.wallet -= dollars
  end

  def how_much?(movie)
    # return price for the selected movie
  end

end