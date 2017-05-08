=begin
Model class of address that has many-one association with 
user model
=end
class Address < ApplicationRecord
	belongs_to :user 
end
