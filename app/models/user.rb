class User < ApplicationRecord
	has_many :addresses 

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates_format_of :email, :with => /@/
end
