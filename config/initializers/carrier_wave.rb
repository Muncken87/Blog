require 'fog/aws'
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAIBB7LS6SCCVNVJ2Q',
    aws_secret_access_key: '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',              region:                'eu-central-1'

  }
  config.fog_directory  = 'rails-blog-alex'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  config.storage = :fog
end
