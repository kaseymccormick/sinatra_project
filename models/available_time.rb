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
  
  #insert into key table all responder id timeframe and day combinations from the form
  #
  #send_availability - requires three intigers
  #
  #returns array
  def self.send_availability(responders_id, timeframes_id, days_id)    
    CONNECTION.execute("INSERT INTO available_times (responders_id, timeframes_id, days_id) VALUES (#{responders_id}, #{timeframes_id}, #{days_id});")
  end

  #figure out the day that occurs most in the available_times table by counting each and returning the id 
  #of the highest count
  #
  #no argument
  #  
  #returns an intiger due to .first["days_id"]
  def self.most_days 
    CONNECTION.execute("SELECT days_id, COUNT(days_id) FROM available_times GROUP BY days_id ORDER BY COUNT(days_id) DESC LIMIT 1;").first["days_id"]
  end

  #figure out the most frequent timeframe of the most frequent day and return the timeframe id
  #
  #most_timeframes - intiger
  #
  #returns an intiger of the id of the slot due to .first["timeframes_id"]
  def self.most_timeframes(day_id)
    CONNECTION.execute("SELECT timeframes_id, COUNT(timeframes_id) FROM available_times GROUP BY timeframes_id HAVING days_id = #{day_id} ORDER BY COUNT(timeframes_id);").first["timeframes_id"] 
  end    
  
  #get a list of responders that have submited that timeframe and day as available
  #
  #list_responders - requires two intigers
  #
  #Should returns an array of hashes
  def self.list_responders(timeframes_id, days_id)
     CONNECTION.execute("SELECT responders_id FROM available_times WHERE timeframes_id = #{timeframes_id} AND days_id = '#{days_id}';")
  end
  
  
  #find a row by id and return objects
  #
  #find - id ->integer
  #
  #returns object of id's row
  def self.find_all_of(id)
    # Figure out the table's name from the class we're calling the method on.
    table_name    = self.to_s.pluralize.underscore

    results = CONNECTION.execute("SELECT * FROM available_times WHERE responders_id = #{id}")
    
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
    CONNECTION.execute("DELETE FROM available_times WHERE responders_id = #{id}")
  end
  
  # may not use this method..
  def save
    CONNECTION.execute("UPDATE available_times SET day_id = #{@day}, timeframes_id = #{@timeframes} WHERE responders_id = #{@id};")
  end
end


