namespace :action_button do
   require 'fileutils'
   
   desc "Replace the old lowpro.js file witht the new one"
   task :update_js do
      lowpro_js = File.dirname(__FILE__) + '/../../../public/javascripts/lowpro.js'
      FileUtils.cp File.dirname(__FILE__) + '/public/lowpro.js', lowpro_js
   end
end
