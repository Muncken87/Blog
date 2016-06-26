ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

ENV['S3_KEY'] = 'AKIAJ5CKKS3LBTKTGXSA'
ENV['S3_SECRET'] = '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'
ENV['S3_REGION'] = 'eu-central-1'
ENV['S3_ENDPOINT'] = 'S3_ENDPOINT'
ENV['S3_BUCKET'] = 'rails-blog-alex'



  # Add more helper methods to be used by all tests here...
end
