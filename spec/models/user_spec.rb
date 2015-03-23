require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "invalid" do
    it 'username that is already in use' do
      email = "unique@example.com"
      user = create(:user, email: email)
      dup = build(:user, email: email)

      expect(user).to be_valid
      expect(dup).to be_invalid
    end
  end

  it 'email must be valid email address' do
    user = build(:user, email: "123@example")
    expect(user).to be_invalid
  end

  it 'username is invalid if not unique' do
    username = "original"
    user = create(:user, email: "abc@example.com", username: username )
    copycat = build(:user, email: "def@example.com", username: username )

    expect(user).to be_valid
    expect(copycat).to be_invalid
  end

  it 'username is invalid if shorter than 2 characters' do
    user = build(:user, username: "j")
    expect(user).to be_invalid
  end

  it 'username is invalid if longer than 12 characters' do
    user = build(:user, username: "mississippi01")
    expect(user).to be_invalid
  end
end
