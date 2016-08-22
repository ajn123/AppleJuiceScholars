class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  validates :name, presence: true, uniqueness: true

  self.per_page = 5

  require 'uri'
  def valid_video?
    if video_url =~ URI::regexp
      return true
    else
     return false
    end
  end
end
