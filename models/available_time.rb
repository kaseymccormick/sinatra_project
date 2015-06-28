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
  # def loop_answers
  #   continents.each_value do |continent|
  #      46:     puts continent
  #      47: end
  # end
  
  
  def self.send_availability(responders_id, timeframes_id, days_id)
   string = "INSERT INTO available_times (responders_id, timeframes_id, days_id) VALUES (#{responders_id}, #{timeframes_id}, #{days_id});"
  
    
    CONNECTION.execute(string)
  end

  
  def self.most_days 
    CONNECTION.execute("SELECT days_id, COUNT(days_id) FROM available_times GROUP BY days_id ORDER BY COUNT(days_id) DESC LIMIT 1;").first["days_id"]
  end

  def self.most_timeframes(day_id)
    CONNECTION.execute("SELECT timeframes_id WHERE days_id = '#{day_id}' COUNT(timeframes_id) FROM available_times GROUP BY timeframes_id ORDER BY COUNT(timeframes_id) DESC LIMIT 1;").first["timeframes_id"]
  end    
  
  #
  #
  #Should returns hash
  def self.list_responders(timeframes_id, days_id)
     CONNECTION.execute("SELECT responders_id FROM available_times WHERE timeframes_id = '#{timeframes_id}' AND days_id = '#{days_id}';")
  end
  
  
  #find a row by id and return objects
  #
  #find - id ->integer
  #
  #returns object of id's row
  def self.find_all_of(id)
    # Figure out the table's name from the class we're calling the method on.
    table_name    = self.to_s.pluralize.underscore

    results = CONNECTION.execute("SELECT * FROM #{table_name} WHERE responders_id = #{id}")
    
    if results.empty?
      return []
    else
      bundle =[]
        results.each do |row|
        bundle.push(self.new(row)) 
        end
        
        return bundle
    end
      
  end
  
  def self.delete_all(id) 
    string = "DELETE FROM available_times WHERE responders_id = #{id}"
    CONNECTION.execute(string)
  end
  
  # may not use this method..
  def save
    string = "UPDATE ages SET slot = '#{@slot}' WHERE id = #{@id};"
    CONNECTION.execute(string)
  end
end


