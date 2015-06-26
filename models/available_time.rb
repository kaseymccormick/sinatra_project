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
  
  #figuring out how to insert into table currently only able to do the first day first timeframe. need to loop through arrays somehow
  def collect_availability 
    binding.pry
    CONNECTION.execute("INSERT INTO available_times (responders_id, timeframes_id, days_id) VALUES ('#{params["responders_id"]}', #{params["slots"]["dates"][0]}, #{params["slots"]["dates"][1]["frames"][0]});")
    binding.pry
  end

  
  def self.most_days 
    CONNECTION.execute("SELECT days_id, COUNT(days_id) FROM available_times GROUP BY days_id LIMIT 1;").first["days_id"]
  end


  def self.most_timeframes
    CONNECTION.execute("select timeframes_id, count(timeframes_id) from available_times group by timeframes_id;")
  end    
  
  # may not use this method..
  def save
    string = "UPDATE ages SET range = '#{@range}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end

