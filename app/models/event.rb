class Event < ActiveRecord::Base
  
  attr_accessible :title
  attr_accessible :date
  attr_accessible :location

  has_many :suggestions, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :movies, :through => :suggestions
  has_many :users, :through => :invitations

end
