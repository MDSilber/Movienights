class Movie < ActiveRecord::Base

  attr_accessible :title

  has_many :suggestions, :dependent => :destroy
  has_many :events, :through => :suggestions

end
