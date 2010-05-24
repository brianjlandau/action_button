namespace :action_button do
  require 'fileutils'

  desc "Install lowpro.js"
  task :install_lowpro do
    lowpro_js = File.join(RAILS_ROOT, 'public/javascripts/lowpro.js')
    FileUtils.cp File.join(File.dirname(__FILE__), '../public/lowpro.js'), lowpro_js
  end

  desc "Install lowpro.jquery.js"
  task :install_jquery_lowpro do
    jquery_lowpro_js = File.join(RAILS_ROOT, 'public/javascripts/lowpro.jquery.js')
    FileUtils.cp File.join(File.dirname(__FILE__), '../public/lowpro.jquery.js'), jquery_lowpro_js
  end
end
