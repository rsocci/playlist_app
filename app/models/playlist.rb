class Playlist < ActiveRecord::Base
  attr_accessible :link

  validates :link, presence: true
end
