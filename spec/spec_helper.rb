ENV["RAILS_ENV"] = "test"
PLUGIN_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'spec'
require 'mocha'
require 'active_support'
require 'action_view'
require File.join(PLUGIN_ROOT, 'spec/tag_matcher.rb')
require File.join(PLUGIN_ROOT, 'lib/action_button.rb')


ActionView::Base.send :include, ActionButton::Helper
ActionView::Helpers::DateHelper.send :include, ActionButton::Helper


Spec::Runner.configure do |config|
   
   config.include(TagMatcher)
   
   # == Mock Framework
   #
   # RSpec uses it's own mocking framework by default. If you prefer to
   # use mocha, flexmock or RR, uncomment the appropriate line:
   #
   config.mock_with :mocha
   # config.mock_with :flexmock
   # config.mock_with :rr
   
end
