# Wrapper for FB Feed data to mask the Graph structure
class FeedData

  attr_accessor :author, :message, :picture_url, :created_at, :link, :id

  def initialize(data)
    self.author       = data['from']['name']
    self.message      = data['message']
    self.picture_url  = data['picture']
    self.created_at   = Time.zone.parse(data['created_time'])
    self.link         = data['link']
    self.id           = data['id']
  end

end
