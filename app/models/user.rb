# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    validates :username, :email, :password_digest, :session_token, presence: true
    validates :username, uniqueness: { message: "^Username already taken" }
    validates :email, uniqueness: { message: "^Email already taken" }





    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username=nil, email=nil, password)
        if username
            user = User.find_by(username: username)
        elsif email
            user = User.find_by(email: email)
        end

        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end
end
