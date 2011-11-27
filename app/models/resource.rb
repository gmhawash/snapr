class Resource < ActiveRecord::Base
  has_attached_file :data,
    :storgae => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml"
end
