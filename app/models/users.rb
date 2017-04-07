class User < ApplicationRecord
	attr_accessor :firstName, :lastName, :email, :dob, :active, :phone_no, :mobile_no
	validates :firstName, presence: true
	validates :lastName, presence: true
end