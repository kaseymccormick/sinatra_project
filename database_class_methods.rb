require"active_support"
require"active_support/inflector"

module DatabaseClassMethods
  #add a new row to the table
  #
  #returns an object
  def add(options={})
    # Example: {"name" => "Sumeet", "age" => 500}
    
    column_names = options.keys
    values = options.values
    
    column_names_for_sql = column_names.join(", ")
    
    individual_values_for_sql = []
    
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else  
        individual_values_for_sql << value
      end  
    end
    
    values_for_sql = individual_values_for_sql.join(", ")
    
    table_name = self.to_s.pluralize.underscore
    
    CONNECTION.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")

    id = CONNECTION.last_insert_row_id
    options["id"] = id

    self.new(options)
  end
  
  
  # Get all of the rows for a table.
  #
  # Returns an Array containing Objects for each row.  
  def all
    # Figure out the table's name from the class we're calling the method on.
    table_name = self.to_s.pluralize.underscore
  
    results = CONNECTION.execute("SELECT * FROM #{table_name}")

    results_as_objects = []
  
    results.each do |result_hash|
      results_as_objects << self.new(result_hash)
    end
  
    return results_as_objects
  end

  # Get a single row.
  #
  # id - The record's Integer ID.
  #
  # Returns an Array containing the Hash of the row.
  def find(id)
    # Figure out the table's name from the class we're calling the method on.
    table_name = self.to_s.pluralize.underscore
  
    CONNECTION.execute("SELECT FROM #{table_name} WHERE id = #{id}")
  end
  
  #delete a single row
  #
  #id - the records integer id
  #
  #returns.. BLEH
  def delete(id)
    table_name = self.to_s.pluralize.underscore  
    CONNECTION.execute("DELETE FROM #{table_name} WHERE id = #{id}")
  end
    #
  # def save
  #   table_name = self.to_s.pluralize.underscore
  #   CONNECTION.execute("UPDATE #{table_name} SET title = '#{title}', WHERE id = #{song_id};")
  # end
end