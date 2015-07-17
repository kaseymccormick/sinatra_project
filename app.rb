#bundling
require 'rubygems'
require 'bundler/setup'

require "pry"
require "sinatra"
require "sinatra/reloader"
require"active_support"
require"active_support/inflector"

#TODO
configure :development do
  require "sqlite3"
  
  ActiveRecord::Base.establish_connection(adapter:'sqlite3' database...)
end

configure :production do 
  gem "pg"
   
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

#database setup
require_relative "database_setup.rb"

#models
require_relative "models/responder.rb"
require_relative "models/timeframe.rb"
require_relative "models/day.rb"
require_relative "models/available_time.rb"

#controllers
require_relative "controllers/main.rb"
require_relative "controllers/responders.rb"
require_relative "controllers/timeframes.rb"
require_relative "controllers/days.rb"
require_relative "controllers/available_times.rb"