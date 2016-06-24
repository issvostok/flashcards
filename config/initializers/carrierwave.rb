CarrierWave.configure do |config|
 config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['aws_access_key_id'],                        # required
      aws_secret_access_key: ENV['aws_access_key_id'],                        # required
      region:                'Oregon'                  # optional, defaults to 'us-east-1'
#      host:                  's3.example.com',             # optional, defaults to nil
#      endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['aws_s3_bucket']                          # required
  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end