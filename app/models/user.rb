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
    validates :username, :email, :password_digest, :session_token, presence: true
    validates :username, uniqueness: { message: "^Username already taken" }
    validates :email, uniqueness: { message: "^Email already taken" }





    # def password=(password)
    #     self.password_digest = BCrypt::Password.create(password)
    # end
end
