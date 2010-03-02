# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

DEFAULT_TIME_ZONE = 'uk'

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem "ttilley-aasm", :lib => 'aasm', :source => 'http://gems.github.com' 
  config.gem "inherited_resources", :source => 'http://gemcutter.org' 
  config.gem "formtastic"
  config.gem "compass", :lib => "compass", :source => "http://gemcutter.org"
  config.gem "compass-960-plugin", :lib => "ninesixty", :source => "http://gemcutter.org"
  config.gem 'unicode'
  config.gem "i18n", :source => 'http://gemcutter.org'
  config.gem "romanvbabenko-ukrainian", :lib => "ukrainian", :source => "http://gems.github.com", :version => ">= 0.2.1"   
  config.gem 'smurf', :source => 'http://gemcutter.org' 
  #config.gem "front-compiler", :source => "http://gemcutter.org" 
  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
  #config.active_record.observers = [:user_observer]

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Kyev' 

  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = DEFAULT_TIME_ZONE.to_sym  
end

date_time_formats = {
  :day_month_year => '%d-%m-%y',
  :day_month_year_with_time => '%H:%M %d-%m-%y',
  :with_time => '%H:%M'
}

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(date_time_formats)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(date_time_formats)

ActionView::Base.field_error_proc = Proc.new{ |html_tag, instance| "<span class=\"field_with_errors\">#{html_tag}</span>" }  
require "#{Rails.root}/config/initializers/extended_form_builder.rb"
ActionView::Base.default_form_builder = ExtendedFormBuilder
require "#{Rails.root}/config/initializers/ext_string.rb"
#require "#{Rails.root}/config/initializers/rails_monkey_patch.rb"
#require "#{Rails.root}/config/initializers/hoptoad_monkey_patch.rb"
require "#{Rails.root}/lib/utils.rb"
require "#{Rails.root}/lib/routing.rb"

#Haml::Template::options[:ugly] = true if Rails.env == 'production'

$KCODE = 'u'
require 'jcode'

#WillPaginate::ViewHelpers.pagination_options[:previous_label] = I18n.t('prev_page')
#WillPaginate::ViewHelpers.pagination_options[:next_label] = I18n.t('next_page')
#WillPaginate::ViewHelpers.pagination_options[:first_label] = I18n.t('first_page')
#WillPaginate::ViewHelpers.pagination_options[:last_label] = I18n.t('last_page')

# 
# class Object
#   def as_text
#     self.to_s
#   end
# end
# 
# class FalseClass
#   def as_text
#     I18n.t('no_label')
#   end
# end
# 
# class TrueClass
#   def as_text
#     I18n.t('yes_label')
#   end
# end
# 
# class NilClass
#   def as_text
#     I18n.t('not_available')
#   end
# end 