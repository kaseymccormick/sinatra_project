require "SQLite3"
require_relative "../database_setup.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Responder
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :e_mail, :age_id
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @e_mail = options["e_mail"]
    @age_id = options['age_id']
  end
    
    #add new responder and verify not duplicate
    #
    #e_mail - string(text) age_id Integer
    #
    #returns array or false TODO  
    def self.add(options={})
      #if the email is in the table it exists (true) if email doesnt exist = false if false add to the table
    
      if self.exist?(options["e_mail"]) == false
    
        CONNECTION.execute("INSERT INTO responders (e_mail, age_id) VALUES ('#{options["e_mail"]}', #{options["age_id"]});")
    
        id = CONNECTION.last_insert_row_id
    
        Responder.new({"id" => options["id"], "email" => options["e_mail"], "age_id" => options["age_id"]})
      else
        #if it exists don't add to table return false
        false
      end
    end
    
    #find responder's email and age_id via id (MODULE)
    #
    # id - The Integer ID of the responder to return.
    #
    # Returns a responder object.
    def self.find_as_object(id)

      # using the `find` method from DatabaseClassMethods.
      result = Responder.find(id).first
      # {"id" => 1, "name" => "Sumeet", "age" => 500}

      Responder.new(result)
    end  
    
    #return all rows in the table 
    #
    #no input required
    #
    #return BLEH TODO
    def self.all_as_object
      result = Responder.all
    end
   
    #get row from table with email
    #
    #e_mail-string
    #
    #returns results as objects array
    def self.get_e_mail(e_mail)    
      # Get the first/only row as a Hash.
      result = CONNECTION.execute("SELECT * FROM responders WHERE e_mail = '#{e_mail}'") #may not need.first
     
      results_as_objects = []
      
      result.each do |result_hash|
        results_as_objects << Responder.new({"id" => result_hash["id"], "e_mail" => result_hash["e_mail"], "age_id" => result_hash["age_id"]})
      
      end
   
      return results_as_objects
      
    end
    
    def save
       CONNECTION.execute("UPDATE responders SET e_mail = '#{@e_mail}', age = #{@age_id} WHERE id = #{@id};")
    end
    
    #verify it's not a duplicate
    #
    #e_mail -string
    #
    #counts the array from get_email returns boolean
    def self.exist?(e_mail)
      get_e_mail(e_mail).length > 0
    end
    

    
#add a new record

end