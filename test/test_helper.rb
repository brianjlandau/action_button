ENV["RAILS_ENV"] = "test"
PLUGIN_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'test/unit'
require 'rubygems'
require 'mocha'
require 'shoulda'
require 'spect'
require 'active_support'
require 'action_controller'
require 'action_view'
require 'rexml/document'
require 'html/document'
require 'active_support/test_case'
require File.join(PLUGIN_ROOT, 'lib/action_button.rb')

ActionView::Base.send :include, ActionButton::Helpers
ActionView::Helpers::FormTagHelper.send :include, ActionButton::Helpers

class ActiveSupport::TestCase
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  
  def assert_tag_in(*opts)
    target = HTML::Document.new(opts.shift, false, false)
    opts = opts.size > 1 ? opts.last.merge({ :tag => opts.first.to_s }) : opts.first
    assert !target.find(opts).nil?, "expected tag, but no tag found matching #{opts.inspect} in:\n#{target.inspect}"
  end
  
  def protect_against_forgery?
    return false
  end
  
end
