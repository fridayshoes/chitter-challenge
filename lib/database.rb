require 'pg'

class Database

  def self.connect(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end