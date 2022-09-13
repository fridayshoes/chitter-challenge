require 'pg'

p "Clearing test database..."
def prepare_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE users, peeps;")
end