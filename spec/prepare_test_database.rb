require 'pg'

# p "Clearing test database..."
def prepare_test_database
  p "Clearing test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE users, peeps;")
end