require "pry"
require "sinatra"
require "sinatra/reloader"

#sql/ database
require "sqlite3"
require_relative "database_setup.rb"

#models
require_relative "models/responder.rb"
require_relative "models/timeframes.rb"

#controllers
require_relative "controllers/main.rb"
require_relative "controllers/responders.rb"
require_relative "controllers/timeframes.rb"