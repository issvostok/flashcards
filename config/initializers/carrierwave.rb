CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      region:                'us-west-2'                 # optional, defaults to 'us-east-1'
#      host:                  's3.example.com',             # optional, defaults to nil
#      endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['aws_s3_bucket']                          # required
  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
