class Snap < ActiveRecord::Base
  has_one :user

  def initialize(params={})
    return super if params.blank?
    response = RestClient.get('http://www.yahoo.com')

    html = response.body
    @noko = Nokogiri::HTML html

    extract("script[type='text/javascript']", :src)
    extract("link[type='text/css']", :href)
    extract("img", :src)
  end

  def extract(css, attr)
    @noko.css(css).each do |tag|
      target = tag.attr(attr)
      next if target.nil?

      # save to AWS
      resource = Resource.new
      resource.data = open('http://static.adzerk.net/Advertisers/9c464d58d29e4f9faef17146971df407.gif')
      user_id = 1
      resource.data_file_name = "%s/%s" % [user_id, 20]
      resource.save
    end
  end
end
