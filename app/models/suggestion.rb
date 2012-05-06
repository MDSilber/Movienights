class Suggestion< ActiveRecord::Base

  attr_accessible :movie_id, :event_id, :user_id
  
  validates :movie_id, :uniqueness => { :scope => :event_id }

  belongs_to :event
  belongs_to :movie
  
  has_many :rankings, :dependent => :destroy
  has_many :users, :through => :suggestions
  
end
