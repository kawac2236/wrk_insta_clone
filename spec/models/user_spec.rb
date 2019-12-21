# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  name                    :string(255)      not null
#  email                   :string(255)      not null
#  crypted_password        :string(255)
#  salt                    :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  avatar                  :string(255)
#  notification_on_comment :boolean          default(TRUE), not null
#  notification_on_follow  :boolean          default(TRUE), not null
#  notification_on_like    :boolean          default(TRUE), not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
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
