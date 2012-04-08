class User < ActiveRecord::Base

  attr_accessible :name
  attr_accessible :email
  attr_accessible :password

  validates :email, :uniqueness => { :message => "The %{value} is already taken. Please enter another email address." }

end
