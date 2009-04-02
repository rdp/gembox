%w[rubygems rake rake/clean fileutils newgem rubigen jeweler].each { |f| require f }
require File.dirname(__FILE__) + '/lib/gembox'

require 'jeweler'
Jeweler::Tasks.new do |s|
  s.name = "gembox"
  s.summary = "A sinatra based interface for browsing and admiring your gems."
  s.email = "aaron@quirkey.com"
  s.homepage = "http://github.com/quirkey/gembox"
  s.description = "A sinatra based interface for browsing and admiring your gems"
  s.authors = ["Aaron Quint"]
  s.files = File.read('Manifest.txt').split("\n")
  s.add_dependency 'sinatra', '>=0.9.1'
  s.add_dependency 'haml', '>=2.0.9'
  s.add_dependency 'activesupport', '>=2.2.2' 
  s.add_dependency 'mislav-will_paginate', '>=2.3.7'
end


# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
# $hoe = Hoe.new('gembox', Jeweler::Version.new(File.expand_path(File.dirname(__FILE__))).to_s) do |p|
#   p.developer('FIXME full name', 'FIXME email')
#   p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
#   p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
#   p.rubyforge_name       = p.name # TODO this is default value
#   # p.extra_deps         = [
#   #   ['activesupport','>= 2.0.2'],
#   # ]
#   p.extra_dev_deps = [
#     ['newgem', ">= #{::Newgem::VERSION}"]
#   ]
#   
#   p.clean_globs |= %w[**/.DS_Store tmp *.log]
#   path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
#   p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
#   p.rsync_args = '-av --delete --ignore-errors'
# end
# 
# require 'newgem/tasks' # load /tasks/*.rake
# Dir['tasks/**/*.rake'].each { |t| load t }