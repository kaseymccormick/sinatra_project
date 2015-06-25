# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("availability.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS responders (id INTEGER PRIMARY KEY, e_mail TEXT, age_id INTEGER);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS ages (id INTEGER PRIMARY KEY, range TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS time_frames (id INTEGER PRIMARY KEY, range TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS days (id INTEGER PRIMARY KEY, date TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS available_times (responders_id INTEGER, timeframes_id INTEGER, days_id INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true