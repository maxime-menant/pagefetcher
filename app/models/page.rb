class Page < ActiveRecord::Base

  attr_accessible :fb_id
  validates       :fb_id, :presence => true, :uniqueness => true

  before_create   :check_page_existence

  def name
    page_data['name']
  end

  def picture_url
    if page_data['picture']
      page_data['picture']['data']['url']
    end
  end

  def feed
    @feed ||= begin
      data     = []
      raw_data = fb_access.get_connections(self.fb_id, 'feed',
      :fields => 'from,message,picture,created_time,link',
      :limit  => '10')

      raw_data.each { |rd| data << FeedData.new(rd)}
      data
    rescue Koala::Facebook::ClientError => e
      raise Exception, 'Something went wrong while fetching the feed'
    end
  end

  private

  def check_page_existence
    begin
      page_data
    rescue Koala::Facebook::ClientError => e
      self.errors.add(:fb_id, :inexistant)
      return false
    end
    true
  end

  def page_data
    @page_data ||= fb_access.get_object(self.fb_id, :fields => 'id,name,picture.type(square)')
  end

  def fb_access
    @fb_access ||= Koala::Facebook::API.new(FbPagesfetcher::Config::FB_TOKEN)
  end

end
