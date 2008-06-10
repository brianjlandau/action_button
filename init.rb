require 'action_button'

ActionView::Base.send :include, ActionButton::Helper
ActionView::Helpers::FormTagHelper.send :include, ActionButton::Helper
