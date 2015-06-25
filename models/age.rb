require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Age
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :group
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @group = options["group"]
  end
  
  # may not use this method..
  def save
    string = "UPDATE age SET group = '#{@group}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end