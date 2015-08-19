class Plan < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :user
	belongs_to :venue
	belongs_to :customer
	belongs_to :booking

end