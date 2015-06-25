require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Day
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :date
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @range = options["date"]
  end
  
  # may not use this method..
  def save
    string = "UPDATE timeframes SET date = '#{@date}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end