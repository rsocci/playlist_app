class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :first_name, presence: true, :length => { :maximum => 30}
  validates :last_name, presence: true, :length => { :maximum => 30}
  validates :email, presence: true, :uniqueness => { :message => "already used"},  
  			:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create}
  validates :password, presence: true, :length => { :minimum => 7}
  validates_confirmation_of :password

  def full_name
  	first_name + " " + last_name
  end
end
