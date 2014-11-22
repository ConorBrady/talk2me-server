class User < ActiveRecord::Base

	has_many :problems
	has_many :decisions

	VALID_EMAIL_REGEX = /\A[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}\z/
	VALID_PASSWORD_REGEX = /\A([a-zA-Z0-9@*#]{8,15})\z/


	before_save   { self.email = email.downcase }

	validates :email,
	presence:   	true,
	format:     	{ with: VALID_EMAIL_REGEX },
	uniqueness: 	{ case_sensitive: false }

	validates :password,
	presence: 		true,
	format: 		{ with: VALID_PASSWORD_REGEX },
	confirmation: 	true

	validates :password_confirmation,
	presence: 		true

	has_secure_password
end
