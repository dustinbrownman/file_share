class Document < ActiveRecord::Base
	belongs_to :upload

	has_attached_file :file
	validates :file, presence: true
end
