class User < ApplicationRecord
	has_many :addresses, inverse_of:  :users

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates_format_of :email, :with => /@/
end
