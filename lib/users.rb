require 'pg'

class User

  attr_reader :user_id, :name, :username, :password, :email
  
  def initialize(user_id:, name:, username:, password:, email:)
    @user_id = user_id
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

    result = connection.exec_params("INSERT INTO users (name, username, password, email) VALUES($1, $2, $3, $4) RETURNING user_id, name, username, password, email;", [name, username, password, email])
    
    User.new(user_id: result[0]["user_id"], name: result[0]["name"], username: result[0]["username"], password: result[0]["password"], email: result[0]["email"])
  end

  def self.authenticate(username:, password:)
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.query("SELECT * FROM users WHERE username = $1", [username])
    # p 'test from users'
    # p result
    return nil unless result.any?
    return nil unless result[0]["password"] == password
    # p result[0]["password"]
    # p result[0]["user_id"]
    return result[0]["user_id"]
    # return User.new(result[0]["user_id"], result[0]["username"])
  end



end