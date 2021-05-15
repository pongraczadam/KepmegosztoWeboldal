class User < ApplicationRecord
    attr_accessor :password

    before_save :encrypt_password

    def User.encrypt(password, salt)
        Digest::SHA1.hexdigest(password + salt)
    end

    def encrypt_password
        return if self.password.blank?
        if self.new_record?
            self.salt = SecureRandom.base64  16
        end
        self.encrypted_password = User.encrypt(self.password, self.salt)
    end
end
