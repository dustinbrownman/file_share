class Recipient < ActiveRecord::Base
	belongs_to :upload

	validates :email, presence: true
end
