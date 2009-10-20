%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/gembox'

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)

$hoe = Hoe.new('gembox', Gembox::VERSION) do |p|
  p.developer('Aaron Quint', 'aaron@quirkey.com')
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  p.rubyforge_name       = 'quirkey'
  p.summary = p.description = "A sinatra based interface for browsing and admiring your gems."
  p.url = ['http://code.quirkey.com/gembox', 'http://github.com/quirkey/gembox']
  p.extra_deps = [
   ['sinatra', '>=0.9.2'],
   ['vegas', '>=0.1.0'],
   ['haml', '>=2.0.9'],
   ['rdoc', '=2.4.3'],
   ['activesupport', '>=2.2.2'],
   ['mislav-will_paginate', '>=2.3.7']
  ]
  
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"],
    ['rack-test', '>=0.1.0']
  ]
  
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }
