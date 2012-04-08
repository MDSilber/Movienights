class User < ActiveRecord::Base

  attr_accessible :name
  attr_accessible :email
  attr_accessible :password

# has_many :events, :dependent => :destroy
  
  validates :email, :uniqueness => { :message => "#{:email} is already taken. Please enter another email address."}

end
