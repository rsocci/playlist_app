class Playlist < ActiveRecord::Base
  attr_accessible :link, :title, :p_id, :score
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :link, presence: true, :uniqueness => { :message => "has already been submitted"},
  			format: {
  				with: /^(spotify:user:|\<iframe src="https:\/\/embed\.spotify\.com\/\?uri=spotify:user:|http:\/\/open\.spotify\.com\/user\/)/
  			}
  validates :title, presence: true, :length => { :maximum => 30}
 
  def self.setup_args(params)
    p_author = params[:playlist][:link].scan(/user[:\/](.+)[\/:]playlist/)
    p_id = params[:playlist][:link].scan(/[a-zA-Z0-9]{22}/)
    unless p_author.empty? or p_id.empty?
      embedded_link = '<iframe src="https://embed.spotify.com/?uri=spotify:user:' + p_author.join + ':playlist:' + p_id.join + '" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>'
      params[:playlist].merge(:p_id => p_id, :link => embedded_link) 
    end
    
  end
end