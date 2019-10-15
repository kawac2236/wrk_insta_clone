require 'rails_helper'

RSpec.describe User, type: :model do
  # 
  let(:user) {
    User.new(name: "Michael", email: 'sample@email.com')
  }

  it "is valid with name,email" do
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

end
