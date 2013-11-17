class Upload < ActiveRecord::Base
	has_one :sender
	has_many :recipients
	has_many :documents

	accepts_nested_attributes_for :sender, :recipients, :documents

	validate :presence_of_sender
	validate :presence_of_recipients
	validate :presence_of_documents

private
	
	def presence_of_sender
		errors.add(:sender, 'must have a sender') if sender.nil?
	end

	def presence_of_recipients
		errors.add(:recipients, 'must have at least one recipient') if recipients.blank?
	end

	def presence_of_documents
		errors.add(:documents, 'must have an attached file') if documents.blank?
	end
end
