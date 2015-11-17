require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'pry' if development?
require 'geocoder'
require 'geocoder/railtie'
Geocoder::Railtie.insert

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

#REST
use Rack::MethodOverride

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the database and models
require APP_ROOT.join('config', 'database')


# Action files
Dir.glob(File.join(APP_ROOT, 'app', 'actions', '**', '*')).each do |file|
  require file
end

#Helper files
Dir.glob(File.join(APP_ROOT, 'app', 'helpers', '**', '*')).each do |file|
    require file
end
