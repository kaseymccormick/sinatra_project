require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class TimeFrame
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :range
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @range = options["range"]
  end
  
  def save
    string = "UPDATE timeframes SET range = '#{@range}'} WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end