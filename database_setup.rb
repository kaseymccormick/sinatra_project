# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("availability_overlap.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS responders (id INTEGER PRIMARY KEY, name TEXT,e_mail TEXT, password TEXT, zipcode INTEGER, user_weight TEXT DEFAULT admin);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS time_frames (id INTEGER PRIMARY KEY, slot TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS days (id INTEGER PRIMARY KEY, date TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS available_times (responders_id INTEGER, timeframes_id INTEGER, days_id INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true