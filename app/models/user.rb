class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me
  has_many :playlists, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, presence: true, :length => { :maximum => 30}
  validates :last_name, presence: true, :length => { :maximum => 30}
  validates :email, presence: true, uniqueness: true 

  def full_name
    "#{first_name} #{last_name}"
  end
end
