1require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

require "resolv-replace.rb" # David Gleba 2016-07-21

module Rail263
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # application.rb
    # config.time_zone = 'Eastern Time (US & Canada)'
    # works.. http://stackoverflow.com/questions/22581235/rails-4-want-to-have-rails-use-my-local-time-zone-for-created-at-updated-at
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    #having trouble with migrations. eg: index error, see migr-2016-08-09.txt
    #config.active_record.table_name_prefix = 'rr4_'
    
    puts "FOO is #{ENV["FOO"].inspect}"
    puts "dbpass is #{ENV["DBPASS1"].inspect}"
    
    end
end
