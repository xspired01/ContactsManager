# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 
    validates :password, length: { minimum: 6, allow_nil: true}
    validates :password_digest, presence: true 
    validates :session_token, presence: true, uniqueness: true 
    # NOTE: password has allow_nil: true which is counterintuitive, but necessary
    # if allow_nil wasn't included, then nil password attribute would never meet the length requirements
    # password is stored in an instance variable (@password) and NOT saved to database, only password digest
    # @password is only set IF PASSWORD IS CHANGED
    # technically, only need to validate the password when it has been changed

    attr_reader :password 

    has_many :contacts 

    after_initialize :ensure_session_token 

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return nil if user.nil? 
        user.is_password?(password) ? user : nil
    end 

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token 
    end 

    # option function
    # def owns_contact?(contact)
    #     contact.user_id == self.id 
    # end 

    private
    def ensure_session_token 
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end 
end 
