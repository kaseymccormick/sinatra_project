require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class AvailableTime
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  
  attr_accessor :responders_id, :timeframes_id, :days_id
  
  #initalize a new responder object
  def initialize(options={})
    @responders_id = options["responders_id"].to_i
    @timeframes_id = options["timeframes_id"].to_i
    @days_id = options["days_id"].to_i
  end
  
  #figuring out how to insert into table
  def collect_availability 
    CONNECTION.execute("INSERT INTO available_times (responders_id, timeframes_id, days_id) VALUES ('#{params["responders_id"]}', #{params["slots"]["dates"][0]}, #{params["slots"]["dates"][1]["frames"][0]});")
  
  end
  
  
  # may not use this method..
  def save
    string = "UPDATE ages SET range = '#{@range}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end