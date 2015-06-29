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
  
  # currently not using this method
  # update one row via id information
  #
  #save - intiger
  #
  #returns array
  def save(id)
    CONNECTION.execute("UPDATE ages SET range = '#{@range}' WHERE id = #{@id};")
  end
end