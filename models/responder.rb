class Responder < ActiveRecord::Base
  
  # has_and_belongs_to_many :days
  #what validation?
  #- uniqueness? (figure out selction pariing allowances)

    
  #get row from table with email
  #
  #e_mail-string
  #
  #returns results as objects array
  def self.get_e_mail(e_mail)    
    # Get the first/only row as a Hash.
    result = ActiveRecord::Base.connection.execute("SELECT * FROM responders WHERE e_mail = '#{e_mail}'") 
     
    results_as_objects = []
      
    result.each do |result_hash|
      results_as_objects << Responder.new({"id" => result_hash["id"], "e_mail" => result_hash["e_mail"], "age_id" => result_hash["age_id"]}) 
    end
    
    return results_as_objects   
  
  end
  
  #verify it's not a duplicate
  #
  #e_mail -string
  #
  #counts the array from get_email returns boolean
  def self.exist?(e_mail)
    get_e_mail(e_mail).length > 0
  end
      
 def self.log_in_user(e_mail, password)
   results = ActiveRecord::Base.connection.execute("SELECT * FROM responders WHERE e_mail = #{email} AND password = #{password}")
   
   if results.empty?
     return false
   else
     result_hash = results.first
     self.new(result_hash)
   end
 end
    
    end
