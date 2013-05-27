class Playlist < ActiveRecord::Base
  attr_accessible :link, :title, :p_id
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :link, presence: true,
  			format: {
  				with: /^(spotify:user:|\<iframe src="https:\/\/embed\.spotify\.com\/\?uri=spotify:user:|http:\/\/open\.spotify\.com\/user\/)/
  			}
  validates :title, presence: true, :length => { :maximum => 30}
  validates :p_id, uniqueness: true

  def self.create_embedded_link(p_author, p_id)
  	'<iframe src="https://embed.spotify.com/?uri=spotify:user:' + p_author.join + ':playlist:' + p_id.join + '" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>'
  end
end



