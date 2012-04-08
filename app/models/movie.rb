class Movie < ActiveRecord::Base

  attr_accessible :title

  has_many :suggestions, :dependent => :destroy
  has_many :events, :through => :suggestions

  validate :title_cannot_be_blank

  def title_cannot_be_blank
    if title.blank?
      errors.add("Please add a title for this movie")
    end
  end

end
