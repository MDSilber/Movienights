class Movie < ActiveRecord::Base

  has_many :suggestions
  has_many :events, :through => :suggestions

end
