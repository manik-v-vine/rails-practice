=begin
Model class of user that has one-many association with 
address model. Also validation has been provided for user's first_name,
user's last_name and valid email format.
=end
class User < ApplicationRecord
	has_many :addresses

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates_format_of :email, :with => /@/
end
