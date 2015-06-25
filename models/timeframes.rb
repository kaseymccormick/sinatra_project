require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class TimeFrames
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :range
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @range = options["range"]
  end