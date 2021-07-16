require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

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
end
