require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Age
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :range
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @range = options["range"]
  end
  
  # may not use this method..
  def save
    string = "UPDATE ages SET range = '#{@range}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end