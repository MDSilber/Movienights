class User < ActiveRecord::Base

  attr_accessible :name, :email, :role
  attr_accessible :password_digest,:password,:password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

  validates :email, :uniqueness => { :message => "The %{value} is already taken. Please enter another email address." }
  validates_confirmation_of :password#, :if => should_validate_password?

#  def should_validate_password?
#   updating_password || new_record?
# end

end
