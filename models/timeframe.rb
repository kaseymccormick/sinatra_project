require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class TimeFrame
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :slot
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @slot = options["slot"]
  end
  
  def save
    string = "UPDATE timeframes SET slot = '#{@slot}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end