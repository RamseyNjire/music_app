require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token) }
    
    it do
      should validate_presence_of(:password_digest).
      with_message("^Password cannot be blank")
    end

    it do
      should validate_uniqueness_of(:username).
      with_message("^Username already taken")
    end

    it do
      should validate_uniqueness_of(:email).
      with_message("^Email already taken")
    end 
  end

  describe "associations" do
    it { should have_many(:notes).dependent(:destroy) }
  end

  describe "#is_password?" do
    it "returns true when password matches" do
      expect{ user.is_password?("password").to be_true }
    end

    it "returns false when password does not match" do
      expect{ user.is_password?("not_password").to be_false }
    end
  end

  describe "#reset_session_token" do
    it "changes the session token when called" do
      old_session_token = user.session_token
      new_session_token = user.reset_session_token

      expect(new_session_token).not_to eq(old_session_token)
    end
  end
end
