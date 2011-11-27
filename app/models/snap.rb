class Snap < ActiveRecord::Base

  def initialize(params)
    response = RestClient.get('http://www.yahoo.com')

    @snap.html = response.body
    Nokogiri::HTML response.body
  end
end
