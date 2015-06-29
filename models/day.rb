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
    @date = options["date"]
  end
  
  # may not currently using this method
  # update 1 row given the id
  #
  #save - intiger
  #
  #return array
  def save
    CONNECTION.execute("UPDATE timeframes SET date = '#{@date}' WHERE id = #{@id};")
  end
end