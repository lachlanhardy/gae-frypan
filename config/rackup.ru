require 'rubygems'
require 'sinatra'

root_dir = File.join(File.dirname(__FILE__), '/../app')

$LOAD_PATH.unshift(root_dir)

set :environment, :production
set :root,        root_dir
set :app_file,    File.join(root_dir, 'app.rb')
disable :run

require root_dir + '/frypan'

run Sinatra::Application