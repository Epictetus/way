ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../app_root/config/environment", __FILE__)
require 'spec/rails'
require 'way'

Spec::Runner.configure do |config|
end
