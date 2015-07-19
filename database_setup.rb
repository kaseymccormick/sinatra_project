# # Load/create our database for this program.
# CONNECTION = SQLite3::Database.new("availability_overlap.db")
#
# # Make the tables.
# CONNECTION.execute("CREATE TABLE IF NOT EXISTS responders (id INTEGER PRIMARY KEY, name TEXT,e_mail TEXT, password TEXT, zipcode INTEGER, user_weight TEXT DEFAULT admin);")
# CONNECTION.execute("CREATE TABLE IF NOT EXISTS time_frames (id INTEGER PRIMARY KEY, slot TEXT);")
# CONNECTION.execute("CREATE TABLE IF NOT EXISTS days (id INTEGER PRIMARY KEY, date TEXT);")
# CONNECTION.execute("CREATE TABLE IF NOT EXISTS available_times (responders_id INTEGER, timeframes_id INTEGER, days_id INTEGER);")
#
# # Get results as an Array of Hashes.
# CONNECTION.results_as_hash = true

# --------------------
#Active record way
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'availability_overlap.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

#setting up the table responders
unless ActiveRecord::Base.connection.table_exists?(:responders)
  ActiveRecord::Base.connection.create_table :responders do |t|
    t.string :name
    t.string :e_mail
    t.string :password
    t.integer :zipcode
    t.string :user_weight, :default => admin
  end  
end

#setting up the table time_frames
unless ActiveRecord::Base.connection.table_exists?(:time_frames)
  ActiveRecord::Base.connection.create_table :time_frames do |t|
    t.string :slot
  end  
end