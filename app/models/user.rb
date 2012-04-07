class User < ActiveRecord::Base

  attr_accessible :email
  attr_accessible :password

  has_many :events, :dependent => :destroy
  
  validates_uniqueness_of :email => { :message => "#{email} is already taken. Please use another email address"}


end
