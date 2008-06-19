require 'action_button'

ActionView::Base.send :include, ActionButton::Helpers
ActionView::Helpers::FormTagHelper.send :include, ActionButton::Helpers
