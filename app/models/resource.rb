class Resource
  attr_accessor :data_file_name, :data_content_type, :data_size

  def credentials

  end

  def connection

  end

  def bucket
    @bucket ||= AWS::S3::Bucket.find(
  end

  def save

  end
end
