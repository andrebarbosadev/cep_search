require 'rails_helper'

RSpec.describe SearchHistory, type: :model do
  it 'Creating a new search history' do
    search_history = create(:search_history)
    expect(search_history).to be_valid
  end

  context 'Validations' do
    it { should validate_presence_of(:cep) }
    it { should validate_presence_of(:logradouro) }
    it { should validate_presence_of(:bairro) }
    it { should validate_presence_of(:cidade) }
    it { should validate_presence_of(:uf) }

    it 'Verify uf length' do
      search_history = build(:search_history, uf: 'PRS')

      expect(search_history).not_to be_valid
    end
  end

  context 'Associations' do
    it { should belong_to(:user) }
  end

  context 'Instance Methods' do
    it 'Return full address' do
      sh = create(:search_history)

      expect(sh.full_address).to eq(
        "#{sh.logradouro}, #{sh.bairro}, #{sh.cidade} - #{sh.uf}")
    end
  end

end
