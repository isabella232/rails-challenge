require File.expand_path('../boot', __FILE__)

# Comment out the frameworks you don't want (if you don't want ActionMailer,
# make sure to comment out the `config.action_mailer` lines in your
# config/environments/development.rb and config/environments/test.rb files):
require 'action_controller/railtie'
require 'dm-rails/railtie'
require 'sprockets/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'rails/test_unit/railtie'
require 'kaminari'
require 'elasticsearch/model'


if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Samplerb
  class Application < Rails::Application

    Elasticsearch::Model.client = Elasticsearch::Client.new host: 'http://localhost:9200', tracer: true
  
    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true

    config.assets.version = '1.0'
  end
end
