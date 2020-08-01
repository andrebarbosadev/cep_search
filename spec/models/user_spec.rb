require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should allow_value("email@addresse.foo").for(:email) }
    it { should_not allow_value("email@addres@se.foo").for(:email) }
    it { should validate_length_of(:password) }
    it { should have_secure_password }
  end

  context 'Associations' do
    it { should have_many(:search_history) }
  end
end
