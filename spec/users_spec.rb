require 'users'


RSpec.describe User do
  describe '.create method' do
    it 'creates a new user' do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')

      expect(user.name).to eq 'admin'
    end
  end

  describe '.authenticate method' do
    it 'returns a user and logs them in if correct email and password are given' do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'admin', password: 'password123')
      expect(authenticated_user.user_id).to eq user.user_id
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

    