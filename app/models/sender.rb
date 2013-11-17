class Sender < ActiveRecord::Base
	belongs_to :upload

	validates :name, presence: true
	validates :email, presence: true
end
