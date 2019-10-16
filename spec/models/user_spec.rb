# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # 
  let(:user) {
    User.new(
      name: "Michael",
      email: "user@example.com",
      password: 'foobar',
      password_confirmation: "foobar"
    )
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

  it "is invalid without password" do
    user = User.new(password: nil)
    binding.pry
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

end
