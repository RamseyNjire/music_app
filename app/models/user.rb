# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    validates :username, :email, :session_token, presence: true
    validates :password_digest, presence: { message: "^Password cannot be blank" }
    validates :username, uniqueness: { message: "^Username already taken" }
    validates :email, uniqueness: { message: "^Email already taken" }
    after_initialize :ensure_session_token

    has_many :notes, dependent: :destroy





    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        
        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        begin
            session_token = SecureRandom::urlsafe_base64(16)
        end while User.exists?(session_token: session_token)

        session_token
    end


    def reset_session_token
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
