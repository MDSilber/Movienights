class Suggestion< ActiveRecord::Base

  attr_accessible :movie_id, :event_id

  belongs_to :event
  belongs_to :movie
  
end
