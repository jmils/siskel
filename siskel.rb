require 'httparty'

class Siskel
  attr_reader :title , :rating, :year, :plot

  def initialize(title, options = {})
    year = options[:year]
    x = options[:plot]
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=#{x}&tomatoes=true")
    @tomato = @movie['tomatoMeter'].to_i
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
  end

  def title
    if @title == nil
      @title = "Movie not found!"
    else
      @title = @movie['Title']
    end
  end

  def consensus
    if @tomato >= 51
       "Thumbs Up"
     else
       "Thumbs Down"
     end
  end
#ends class
end
