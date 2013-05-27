class Comment < ActiveRecord::Base
  attr_accessible :content, :playlist_id
  belongs_to :user
  belongs_to :playlist

  validates :content, presence: true

end
