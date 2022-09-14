require 'pg'

def persisted_data(user_id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM users WHERE user_id = '#{user_id}';")
  result.first
end