require 'users'

RSpec.describe User do
  describe '.create method' do
    it 'creates a new user' do
      user = User.create(name: 'admin', username: 'admin', email: 'admin@makersacademy.com', password: 'password123')

      expect(user.name).to eq 'admin'
    end
  end
end

    