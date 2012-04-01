class Movie < ActiveRecord::Base

  attr accessible :title

  has_many :suggestions
  has_many :events, :through => :suggestions

end
