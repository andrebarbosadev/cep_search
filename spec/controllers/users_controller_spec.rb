require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'show users list' do
    create(:user)
    #get :index
    #expect(response).to be_success
  end
end
