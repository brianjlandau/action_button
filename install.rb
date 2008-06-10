require 'fileutils'

# Installs the custom version of lowpro.js
lowpro_js = File.dirname(__FILE__) + '/../../../public/javascripts/lowpro.js'
FileUtils.cp File.dirname(__FILE__) + '/public/lowpro.js', lowpro_js
