require 'pg'

class Peeps

  attr_reader :id, :peep, :created_on
  
  def initialize(peep:, created_on:)
    # @id  = id
    @peep = peep
    @created_on = created_on
  end

  def self.create(peep:, created_on:)
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO peeps (peep, created_on) VALUES($1, $2)RETURNING peep, created_on;", [peep, created_on])
    Peeps.new(peep: result[0]["peep"], created_on: result[0]["created_on"])
  end


  def self.all
    # [
    #   "hello everyone",
    #   "Still got this bloomin lurgy and high temperature.",
    #   "Why is he sniffing so much?",
    #   "I am in the curry house",
    # ]
    # connection = PG.connect(dbname: 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;") #Ask DB to sort list descending by id
    # result.map { |message| message['peep'] }
    result.map do |message| 
      # message['peep']
      Peeps.new(peep: message['peep'], created_on: message['created_on'])
    end
  end
end