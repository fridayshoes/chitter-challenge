require 'database_helpers'
require 'users'


RSpec.describe User do
  describe '.create method' do
    it 'creates a new user' do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')
      persisted_data = persisted_data(user_id: user.user_id)
      expect(user.name).to eq 'admin'
      expect(user.username).to eq 'admin'
      expect(user.email).to eq 'admin@makersacademy.com'
      expect(user.password).to eq 'password123'
      expect(user.user_id).to eq persisted_data['user_id']
    end
  end

  describe '.authenticate method' do
    it 'returns a unique user_id if correct email and password are given' do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')
      persisted_data = persisted_data(user_id: user.user_id)
      # p 'test 1'
      # p user.user_id
      authenticated_user = User.authenticate(username: 'admin', password: 'password123')
      # p 'test 2'
      # p authenticated_user
      expect(authenticated_user).to eq user.user_id
    end

    it "returns nil if incorrect username given" do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')
      expect(User.authenticate(username: 'bob', password: 'password123')).to be_nil
    end

    it "returns nil if incorrect password given" do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')
      expect(User.authenticate(username: 'admin', password: 'password')).to be_nil
    end
  end
    

end

    