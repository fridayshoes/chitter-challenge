require 'peeps'

RSpec.describe Peeps do
  describe '.create method' do
    it 'creates a new peep' do
      message = Peeps.create(peep: 'hello everyone', created_on: '2022-06-10 21:56:16.759063')

      expect(message.peep).to eq 'hello everyone'
    end
  end

  describe '.all method' do
    it 'returns all peeps' do
      
      Peeps.create(peep: 'hello everyone', created_on: '2022-06-10 21:56:16.759063')
      Peeps.create(peep: 'Still got this bloomin lurgy and high temperature.', created_on: '2022-06-12 18:41:54.015632')
      Peeps.create(peep: 'Why is he sniffing so much?',	created_on: '2022-06-12 18:46:32.850734')
      Peeps.create(peep: 'I am in the curry house',	created_on: '2022-06-12 18:47:03.577594')

      peeps = Peeps.all

      expect(peeps.last.peep).to eq "hello everyone"
      # expect(peeps).to eq "Still got this bloomin lurgy and high temperature."
      # expect(peeps).to eq "Why is he sniffing so much?"
      # expect(peeps).to eq "I am in the curry house"
    end
  end
end