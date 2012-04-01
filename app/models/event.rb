class Event < ActiveRecord::Base

  has_many :suggestions
  has_many :movies, :through => :suggestions

end
