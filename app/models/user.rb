

require 'bcrypt'


class User < ActiveRecord::Base
	# attr_accessor :password
	# before_save :encrypted_password
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, message: "EMAIL NOT VALID", multiline: true
	has_many :questions
	has_many :answers

include BCrypt

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
    # This is where the real work is done, store the BCrypt has in the
    # database
	   #  def encrypted_password
	   #    # if password.present?
	   #    self.encrypted_password = BCrypt::Password.create(password)
		  # end    
	    
  	

	def self.authenticate(email, password)
		if user = find_by_email(email)
			if BCrypt::Password.new(user.encrypted_password).is_password? password

				return user
			end
		end
		return nil
	end
end

