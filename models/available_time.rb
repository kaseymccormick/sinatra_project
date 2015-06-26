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
    CONNECTION.execute("SELECT timeframes_id, COUNT(timeframes_id) FROM available_times GROUP BY timeframes_id LIMIT 1;").first["timeframes_id"]
  end    
  
  def self.list_responders(timeframes_id, days_id)
   
      result = CONNECTION.execute("SELECT responders_id FROM available_times WHERE timeframes_id = '#{timeframes_id}' AND days_id = '#{days_id}'")
      binding.pry
      results_as_objects = []
      binding.pry
      result.each do |result|
        results_as_objects << AvailableTime.new({"responder_id" => result["responder_id"],}) 
        
      end
      binding.pry
     
      #connect to db return all responders_id's where the timeframes_id is == self.most_timeframes and days_id is == self.most_days
  end
  # may not use this method..
  def save
    string = "UPDATE ages SET range = '#{@range}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end

