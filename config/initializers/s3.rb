require 'aws/s3'

raw_config = File.read(RAILS_ROOT + "/config/s3.yml")
yaml = YAML.load(raw_config)
S3_CONFIG = yaml[RAILS_ENV].symbolize_keys

AWS::S3::Base.establish_connection!(
  :access_key_id     => S3_CONFIG[:access_key_id],
  :secret_access_key => S3_CONFIG[:secret_access_key]
)
