class User < ActiveRecord::Base
	belongs_to :organisation
	has_many :bookings
	has_many :customers
	has_many :venues
	has_many :reports

end
