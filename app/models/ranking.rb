class Ranking < ActiveRecord::Base
  
  attr_accessible :user_id, :suggestion_id

  belongs_to :user
  belongs_to :suggestion

end
