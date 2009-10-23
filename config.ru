# To use with thin 
#  thin start -p PORT -R config.ru
ENV['GEM_PATH'] = '/home/rdp/installs/mbari_gembox_187/lib/ruby/gems/1.8'
Gem.clear_paths
require File.join(File.dirname(__FILE__), 'lib', 'gembox')

disable :run
Gembox::App.set({
  :environment => :production
})
run Gembox::App
