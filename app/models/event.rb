class Event < ActiveRecord::Base
  
  attr_accessible :title
  attr_accessible :date
  attr_accessible :location

  has_many :suggestions, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :movies, :through => :suggestions
  has_many :users, :through => :invitations


  def get_top_three
    movies = Hash.new
    
    self.suggestions.each do |s|
      s.rankings.each do |r|
        if movies[s.movie.title]
          movies[s.movie.title] += r.value
        else
          movies[s.movie.title] = r.value
        end
      end
    end
    
    movies.sort_by{ |title,value| value}

    top_three = Array.new
    
    counter = 0
    movies.each do |key, value|
      top_three[counter] = key
      counter += 1
      break if counter == 3
    end
    
    top_three
  end

end
