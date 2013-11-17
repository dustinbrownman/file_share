class Upload < ActiveRecord::Base
	has_one :sender
	has_many :recipients
	has_many :documents

	accepts_nested_attributes_for :sender, :recipients, :documents
end
