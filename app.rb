#bundling
require 'rubygems'
require 'bundler/setup'

require "pry"
require "sinatra"
require "sinatra/reloader"
require"active_support"
require"active_support/inflector"


#sql/ database
require "sqlite3"
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