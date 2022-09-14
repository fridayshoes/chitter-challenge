require 'database'

describe Database do
  describe '.connect' do
    it 'connects to test database through PG' do
      
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      Database.connect('chitter_test')

    end
  end

  describe '.query' do
    it 'executes a query via PG on test database' do
      connection = Database.connect('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])

      Database.query("SELECT * FROM peeps;", [])
    end
  end

  describe '.connect' do
    it 'connects to live database through PG' do
      
      expect(PG).to receive(:connect).with(dbname: 'chitter')

      Database.connect('chitter')

    end
  end

  describe '.query' do
    it 'executes a query via PG on live database' do
      connection = Database.connect('chitter')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])

      Database.query("SELECT * FROM peeps;", [])
    end
  end
end