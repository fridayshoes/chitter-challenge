require 'pg'

class User

  attr_reader :name, :username, :password, :email
  
  def initialize(name:, username:, password:, email:)
    @name = name
    @username = username
    @password = password
    @email = email
  end

  def self.create(name:, username:, password:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO users (name, username, password, email) VALUES($1, $2, $3, $4)RETURNING name, username, password, email;", [name, username, password, email])
    User.new(name: result[0]["name"], username: result[0]["username"], password: result[0]["password"], email: result[0]["email"])
  end
end