class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$/
	VALID_PASSWORD_REGEX = /^([a-zA-Z0-9@*#]{8,15})$/

	attr_accessible :password

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
