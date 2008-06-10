require File.dirname(__FILE__) + '/spec_helper'

describe ActionButton, 'using button_tag' do
  include ActionView::Helpers::TagHelper
  include ActionButton::Helper
  
  before(:each) do
    @button = button_tag 'action', 'Do this', 'submit', :value => 1
  end
  
  it 'should set the name' do
    @button.should include_tag(:button, :attributes => {:name => 'action'})
  end
  
  after(:each) do
    @button = nil
  end
end
