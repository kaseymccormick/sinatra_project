require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Responder
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :e_mail, :age_id, :name
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @name = options["name"]
    @e_mail = options["e_mail"]
    @age_id = options['age_id']
  end
    
  #add new responder and verify not duplicate
  #
  #e_mail - string(text) age_id Integer
  #
  #returns object or false   
  def self.add(options={})
    #if the email is in the table it exists (true) if email doesnt exist = false if false add to the table
    
    if self.exist?(options["e_mail"]) == false
    
      CONNECTION.execute("INSERT INTO responders (name, e_mail, age_id) VALUES ('#{options["name"]}','#{options["e_mail"]}', #{options["age_id"]});")

      id = CONNECTION.last_insert_row_id
      options["id"] = id

      Responder.new({"id" => options["id"],"name"=>options["name"], "email" => options["e_mail"], "age_id" => options["age_id"]})
    else
      #if it exists don't add to table return false
      false
    end
  end
   
  #get row from table with email
  #
  #e_mail-string
  #
  #returns results as objects array
  def self.get_e_mail(e_mail)    
    # Get the first/only row as a Hash.
    result = CONNECTION.execute("SELECT * FROM responders WHERE e_mail = '#{e_mail}'") 
     
    results_as_objects = []
      
    result.each do |result_hash|
      results_as_objects << Responder.new({"id" => result_hash["id"], "e_mail" => result_hash["e_mail"], "age_id" => result_hash["age_id"]}) 
    end
    
    return results_as_objects   
  
  end
  
  #update a row in the table via table id
  #
  #save - integer
  #
  #returns array of hash  
  def save
    CONNECTION.execute("UPDATE responders SET e_mail = '#{@e_mail}', age_id = #{@age_id} WHERE id = #{@id};")
  end
    
  #verify it's not a duplicate
  #
  #e_mail -string
  #
  #counts the array from get_email returns boolean
  def self.exist?(e_mail)
    get_e_mail(e_mail).length > 0
  end
      

    
end