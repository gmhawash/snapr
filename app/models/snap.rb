class Snap < ActiveRecord::Base
  belongs_to :user

  def save
    response = RestClient.get(self.url)
    @noko = Nokogiri::HTML response.body
    extract("script[type='text/javascript']", :src)
    extract("link[type='text/css']", :href)
    extract("img", :src)
    self.body = @noko.to_html
    super
  end

  def extract(css, attr)
    @noko.css(css).each do |tag|
      @target = tag.attr(attr)
      next if @target.nil?

      # save to AWS
      store
      tag.set_attribute(attr.to_s, private_url)
    end
  end

  def filename
    uri = URI.parse(@target)
    ("%s/%s/%s" % [user_id, id, uri.request_uri]).gsub('//','/')
  end

  def bucket_name
    S3_CONFIG[:bucket]
  end

  def store
    AWS::S3::S3Object.store(filename, open(@target), bucket_name)
  end

  def private_url
    "%s/%s" % [GlobalContext.http_host, filename]
  end

  def public_url(resource)
    "%s/%s/%d/%d/%s" % ['https://s3.amazonaws.com', bucket_name, user_id, id, resource]
  end
end
